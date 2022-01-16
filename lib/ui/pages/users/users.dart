import 'package:bobebet_app/models/tree.dart';
import 'package:bobebet_app/models/users.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/enable_or_disable_user_service.dart';
import 'package:bobebet_app/services/users_service.dart';
import 'package:bobebet_app/ui/pages/users/credit_add_page.dart';
import 'package:bobebet_app/ui/pages/users/user_add_page.dart';
import 'package:bobebet_app/ui/pages/users/user_master_update_page.dart';
import 'package:bobebet_app/ui/pages/users/user_update_page.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_treeview/tree_view.dart';


class UsersPage extends StatefulWidget {

  final bool expanded ;

  const UsersPage({ Key? key, this.expanded=true}) : super(key: key);


  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  final GlobalKey<ScaffoldState> _scaffoldStateKey = new GlobalKey<ScaffoldState>() ;

  Validator validator = Validator() ;

  var usersService = new UsersService() ;
  EnableOrDisableUserService enableOrDisableUserService = new EnableOrDisableUserService() ;
  late UserTree userTree ;

  late double _height;

  late TreeViewController _treeViewController;
  bool docsOpen = true;
  bool deepExpanded = true;

  final Map<ExpanderPosition, Widget> expansionPositionOptions = const {
    ExpanderPosition.start: Text('Start'),
    ExpanderPosition.end: Text('End'),
  };

  final Map<ExpanderType, Widget> expansionTypeOptions = const {
    ExpanderType.caret: Icon(
      Icons.arrow_drop_down,
      size: 40,
    ),
    ExpanderType.arrow: Icon(Icons.arrow_downward),
    ExpanderType.chevron: Icon(Icons.expand_more),
    ExpanderType.plusMinus: Icon(Icons.add),
  };

  final Map<ExpanderModifier, Widget> expansionModifierOptions = const {
    ExpanderModifier.none: ModContainer(ExpanderModifier.none),
    ExpanderModifier.circleFilled: ModContainer(ExpanderModifier.circleFilled),
    ExpanderModifier.circleOutlined:
    ModContainer(ExpanderModifier.circleOutlined),
    ExpanderModifier.squareFilled: ModContainer(ExpanderModifier.squareFilled),
    ExpanderModifier.squareOutlined:
    ModContainer(ExpanderModifier.squareOutlined),
  };

  ExpanderPosition _expanderPosition = ExpanderPosition.start;
  ExpanderType _expanderType = ExpanderType.caret;
  ExpanderModifier _expanderModifier = ExpanderModifier.none;

  late  bool loading = false ;
  late String json ;
  late String userIdSelected = "" ;
  late  String sessionUserId = "" ;
  late  String role = "" ;
  late bool expanded ;
  late bool status = false ;

  UserAdd userAdd = UserAdd() ;

  @override
  void initState() {
    expanded = widget.expanded ;
    _treeViewController = TreeViewController();
    _load();
    Prefs.sessionUserId.then((value) => {
      sessionUserId = value,
      Prefs.role.then((value) => {
        role = value
      })
    });
    super.initState();
  }


  User getUser(String id) {
    for(var i=0; i<userTree.users.length; i++){
      User user = userTree.users[i] ;
      if(user.id == id) {
        return user;
      }
    }
    return  User();
  }

  Future<void> _get() {
    return usersService.userTree(expanded).then((value) => {
      if(value.statusCode == 0) {
        setState(() {
          userTree = value.userTree ;
          _treeViewController = _treeViewController.loadJSON(json: userTree.jsonTree);
          loading=false;
        }),
      } else {
        if(value.statusCode == 99) {
          setState(() {
            loading = false ;
          }),
          MessageWidget.expired(context)
        } else {
            MessageWidget.error(context, "Ha ocurrido un error. Detalles: " + value.message, 4)
        }
      }
    }) ;
  }

  enableOrDisableUser() {
   /* Icons.account_circle;
    Icons.account_box_outlined;
    Icons.supervised_user_circle;*/
    setState(() {
      expanded=true;
      status = !status ;
      loading = true;
    });
    enableOrDisableUserService.change(status, userIdSelected).then((value) => {
      if(value.statusCode == 0) {
        setState(() {
          loading = false;
        }),
        if(status) {
          MessageWidget.info(context, "Usuario activado", 2)
        } else {
          MessageWidget.info(context, "Usuario desactivado", 2)
        },
        this._load()
      } else  {
        setState(() {
          loading = false;
        }),
        if (value.statusCode == 461) {
          MessageWidget.expiredVersion(context)
        } else {
          if (value.statusCode == 99) {
            MessageWidget.expired(context)
          } else {
            MessageWidget.error(context, value.message, 4)
          }
        }
      }
    });
  }

  _load() {
    setState(() {
      loading = true ;
    });
    _get() ;
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldStateKey,
        body: Container(
            color: Colors.deepPurple,
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: _height / 30),
                  Buttons.backButton(context, color: Colors.white),
                  Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Switch(
                              activeColor: Colors.deepPurple,
                              activeTrackColor: Colors.deepPurple.shade300,
                              value: status,
                              onChanged: (v) => {
                                if(userIdSelected!="") {
                                    enableOrDisableUser()
                                } else {
                                  MessageWidget.warn(context, "Debes seleccionar un usuario",2)
                                }
                              }
                          ),
                          IconButton(icon: Icon(Icons.attach_money, size: 30, color: Colors.white), onPressed: () => {
                            if(userIdSelected!="") {
                              _navigateToCreditManager(context)
                            } else {
                              MessageWidget.warn(context, "Debes seleccionar un usuario",2)
                            }
                          }),
                          IconButton(
                              icon: Icon(Icons.add_circle, size: 30, color: Colors.white),
                              onPressed: ()=>{
                                _navigateToAddUser(context)
                              }
                          ),
                          IconButton(
                              icon: Icon(Icons.edit, size: 30, color: Colors.white),
                              onPressed: ()=>{
                                if(userIdSelected!="") {
                                  _navigateToUpdateUser(context)
                                } else {
                                  MessageWidget.warn(context, "Debes seleccionar un usuario",2)
                                }
                              }
                          ),
                          IconButton(icon: Icon(Icons.refresh, size: 30, color: Colors.white), onPressed: () => {
                            _load()
                          }),
                        ],
                      )
                  ),
                  SizedBox(height: _height / 50),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                      ),
                      padding: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                      child:  _tree() ,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.person, color: Colors.white30, size: 24,),
                      Text(" Master  ", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white30, fontSize: 16),),
                      Icon(Icons.perm_identity, color: Colors.white30, size: 24,),
                      Text(" Común  ", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white30, fontSize: 16),),
                      Icon(Icons.account_balance, color: Colors.white30, size: 24,),
                      Text(" Banco", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white30, fontSize: 16),)
                    ],
                  )
                ]
            )
        )
    );
  }


  _tree() {
    TreeViewTheme _treeViewTheme = TreeViewTheme(
      expanderTheme: ExpanderThemeData(
        type: _expanderType,
        modifier: _expanderModifier,
        position: _expanderPosition,
        color: Colors.white,
        size: 25,
      ),
      labelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.3,
      ),
      parentLabelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        size: 20,
        color: Colors.white,
      ),
      colorScheme: Theme.of(context).brightness == Brightness.light
          ? ColorScheme.light(
        primary: Colors.deepPurple.shade400,
        onPrimary: Colors.white,
        background: Colors.transparent,
        onBackground: Colors.white,
      )
          : ColorScheme.dark(
        primary: Colors.white,
        onPrimary: Colors.white,
        background: Colors.transparent,
        onBackground: Colors.white70,
      ),
    );

    if(!loading) {
        return TreeView(
          controller: _treeViewController,
          allowParentSelect: true,
          supportParentDoubleTap: true,
          onExpansionChanged: (key, expanded) => _expandNode(key, expanded),
          onNodeTap: (key) {
            debugPrint('Selected: $key');
            setState(() {
              userIdSelected = key;
              User user = getUser(userIdSelected);
              if(user.enable) {
                status=true;
              } else {
                status=false;
              }
              _treeViewController = _treeViewController.copyWith(selectedKey: key);
            });
          },
          theme: _treeViewTheme,
        );
    } else {
      return HelperFunctions.loading() ;
    }
  }

  _navigateToAddUser(BuildContext context) async {
    setState(() {
      expanded=true;
    });
    if(role == "ROLE_MASTER") {
      if(userIdSelected == "") {
        MessageWidget.warn(context, "Debes seleccionar un usuario",2) ;
        return;
      }
    }
    final result = await Navigator.push(context, MaterialPageRoute(
          builder: (context) =>
              UserAddPage(
                  userIdParent: sessionUserId,
                  role: getUser((role == "ROLE_MASTER") ? userIdSelected : sessionUserId).role,
                  userIdSelected: (role == "ROLE_MASTER") ? userIdSelected : sessionUserId)
      ));
      if (result == "created") {
        this._load();
        MessageWidget.info(context, "Usuario creado satisfactoriamente.", 4);
      }

  }

  _navigateToUpdateUser(BuildContext context) async {
    setState(() {
      expanded=true;
    });
    if(sessionUserId == userIdSelected && role == "ROLE_MASTER") {
      User? user = getUser(sessionUserId);
      final result = await Navigator.push(context,MaterialPageRoute(builder: (context) => UserMasterUpdatePage(user: user)));
      if (result == "updated") {
        this._load();
        MessageWidget.info(context, "Usuario master actualizado satisfactoriamente.", 4);
      }
    } else {
      final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => UserUpdatePage(userIdSelected: userIdSelected, user: getUser(userIdSelected))));
      if (result == "updated") {
        this._load();
        MessageWidget.info(
            context, "Usuario actualizado satisfactoriamente.", 4);
      }
    }
  }

  _navigateToCreditManager(BuildContext context) async {
    setState(() {
      expanded=true;
    });
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            CreditManagerPage(
                userId: userIdSelected
            )
        )
    );
    if(result == "created") {
      this._load();
    }
  }

  _expandNode(String key, bool expanded) {
    String msg = '${expanded ? "Expanded" : "Collapsed"}: $key';
    debugPrint(msg);

    Node node = _treeViewController.getNode(key);
    if (node != null) {
      List<Node> updated;
      if (key == 'docs') {
        updated = _treeViewController.updateNode(
          key,
          node.copyWith(
              expanded: expanded,
              icon: NodeIcon(
                codePoint: expanded
                    ? Icons.folder_open.codePoint
                    : Icons.folder.codePoint,
                color: expanded ? "blue600" : "grey700",
              )),
        );
      } else {
        updated = _treeViewController.updateNode(
            key, node.copyWith(expanded: expanded));
      }
      setState(() {
        if (key == 'docs') docsOpen = expanded;
        _treeViewController = _treeViewController.copyWith(children: updated);
      });
    }
  }
}

class ModContainer extends StatelessWidget {
  final ExpanderModifier modifier;

  const ModContainer(this.modifier, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _borderWidth = 0;
    BoxShape _shapeBorder = BoxShape.rectangle;
    Color _backColor = Colors.transparent;
    Color _backAltColor = Colors.grey.shade700;
    switch (modifier) {
      case ExpanderModifier.none:
        break;
      case ExpanderModifier.circleFilled:
        _shapeBorder = BoxShape.circle;
        _backColor = _backAltColor;
        break;
      case ExpanderModifier.circleOutlined:
        _borderWidth = 1;
        _shapeBorder = BoxShape.circle;
        break;
      case ExpanderModifier.squareFilled:
        _backColor = _backAltColor;
        break;
      case ExpanderModifier.squareOutlined:
        _borderWidth = 1;
        break;
    }
    return Container(
      decoration: BoxDecoration(
        shape: _shapeBorder,
        border: _borderWidth == 0
            ? null
            : Border.all(
          width: _borderWidth,
          color: _backAltColor,
        ),
        color: _backColor,
      ),
      width: 15,
      height: 15,
    );
  }
}






















































