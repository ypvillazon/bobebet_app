import 'package:another_flushbar/flushbar.dart';
import 'package:bobebet_app/configuration/configuration.dart';
import 'package:bobebet_app/models/actualizacion.dart';
import 'package:bobebet_app/models/login.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/login_service.dart';
import 'package:bobebet_app/services/verificar_actualizacion_service.dart';
import 'package:bobebet_app/ui/pages/login/account_check.dart';
import 'package:bobebet_app/ui/pages/login/reset_password_init.dart';
import 'package:bobebet_app/ui/pages/pin/pin_register.dart';
import 'package:bobebet_app/ui/pages/updated/update.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.from}) : super(key: key);

  final int from;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  VerificarActualizacionService verificarActualizacionService = VerificarActualizacionService();
  bool verificandoActualizacion = false;
  bool hayQueActualizar = false;
  late Actualizacion actualizacion ;

  Validator validator = Validator() ;
  LoginService loginService = new LoginService();
  Login login = Login() ;
  bool loading = false ;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (widget.from == 0) {
        MessageWidget.info(context, "Su cuenta ha sido activada satisfactoriamente.", 4, pos: FlushbarPosition.TOP);
      } else {
        if (widget.from == 1) {
          MessageWidget.info(context, "Su contrasena ha sido restablecida satisfactoriamente.", 4, pos: FlushbarPosition.TOP);
        } else {
          if (widget.from == 3) {
            MessageWidget.info(context,
                "Bienvenido a -Bobe Apuestas-, autentíquese para ver nuestros servicios o verifique su cuenta con un correo que le hemos enviado.",
                6, pos: FlushbarPosition.TOP);
          } else {
            if (widget.from == 4) {
              MessageWidget.info(context,"Sessión cerrada satisfactoriamente", 6, pos: FlushbarPosition.TOP);
            } else {
              if (widget.from == 5) {
                MessageWidget.info(context,"Su sessión ha expirado, debe volver a iniciar todo.", 6, pos: FlushbarPosition.TOP);
              }
            }
          }
        }
      }
    });
    checkActualizacion();
  }

  checkActualizacion() {
    setState(() {
      verificandoActualizacion=true;
    });
    verificarActualizacionService.check().then((value) {
      if (value.statusCode == 0) {
        actualizacion = value.actualizacion;
        hayQueActualizar = (actualizacion.versionAppStatus == 'RECIENTE' || actualizacion.versionAppStatus == 'OBSOLETA');
        if(actualizacion.versionAppStatus != "ACTIVA") {
          if(IS_WEB) {
            MessageWidget.warn(context,
                "¡ NUEVA ACTUALIZACIÓN ! \n"
                    "Usted presenta la versión " + actualizacion.versionName + " y la cual debe actualizar por " + actualizacion.nowVersionName + ". \n"
                    "Para realizar esta acción, debe borrar la caché de nu navegador.\n"
                    "Para cerrar este mensaje, deslice hacia arriba." ,
                25, pos: FlushbarPosition.TOP);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                UpdatePage(actualizacion: actualizacion)));
          }
        }
        setState(() {
          verificandoActualizacion=false;
        });
      } else {
        setState(() {
          verificandoActualizacion=false;
        });
        MessageWidget.error(context, "No se ha podido verificar las actualizaciones.", 4);
      }
    });
  }

  hide() {
    setState(() {
      loading = false ;
    });
  }

  _onChanceEmail(String v) {
    setState(() {
      login.email = v ;
    });
  }

  _onChancePassword(String v) {
    setState(() {
      login.password = v ;
    });
  }

  _onPressed() {
    if(validator.isEmpty(login.email) || validator.isEmpty(login.password)) {
      MessageWidget.error(context, "Todos los campos son obligatorios.", 3) ;
    } else {
      if(validator.validateEmail(login.email) != "") {
        MessageWidget.error(context, "La dirección de correo electrónico no es válida.", 3) ;
      } else {
        setState(() {
          loading = true ;
        });
        loginService.doLogin(login).then((value) => {
          if(value.statusCode == 0) {
            Prefs.setSessionId(value.session.sessionId) ,
            Prefs.setSessionUserId(value.session.userId) ,
            Prefs.setRole(value.session.role) ,
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PinRegisterPage(session: value.session)))
          } else {
            hide(),
            MessageWidget.error(context, value.message, 4)
          }
        });
      }
    }
  }

  Widget _entryField(String title, dynamic _onchange, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: _onchange,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AccountCheckPage() ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¿Aún no has verificado tu cuenta?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              'Verificar',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Correo electrónico", _onChanceEmail),
        _entryField("Contraseña", _onChancePassword, isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body:
        loading ?
        HelperFunctions.loading()
        :
        Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 40),
                  (hayQueActualizar) ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: Icon(Icons.file_download, size: 40, color: Colors.white),
                          onPressed: ()=>{
                            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(actualizacion: actualizacion)))
                          }
                      )
                    ],
                  ) :
                  Container(),
                  SizedBox(height: 30),
                  Texts.title1(),
                  Texts.title2(),
                  Texts.version(),
                  SizedBox(height: 30),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  Buttons.submitButton(_onPressed, context, "Autenticar"),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResetPasswordInitPage()),
                        )
                      },
                      child: Text('¿Olvidastes la contraseña?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blue)),
                  )),
                 // _divider(),
                 // _facebookButton(),
                  SizedBox(height: height * .055),
                  _createAccountLabel(),
                ],
              ),
            ),
          ),
          //Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));

  }
}
