import 'package:bobebet_app/services/get_bet_summary_stats_service.dart';
import 'package:bobebet_app/ui/pages/stats/bets/bet_by_user/bet_summary_stats_by_user_page.dart';
import 'package:bobebet_app/ui/pages/stats/bets/bet_stats/bet_all_stats_page.dart';
import 'package:bobebet_app/ui/pages/stats/bets/summary_stats/bet_summary_stats_page.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/option.dart';
import 'package:flutter/material.dart';

class StatsHomePage extends StatefulWidget {
  @override
  _StatsHomePagetate createState() => _StatsHomePagetate();
}

class _StatsHomePagetate extends State<StatsHomePage> {
  bool checkBoxValue = false;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
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
                      SizedBox(height: height/20),
                      Buttons.backButton(context, color: Colors.black),
                      //SizedBox(height: height * .2),

                      SizedBox(height: height/20),
                      OptionWidget(
                        icon: Icons.format_list_numbered,
                        title: 'Apuestas',
                        subtitle: 'Listado de todas las apuestas.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetAllStatsPage()))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.person,
                        title: 'Usuarios',
                        subtitle: 'Resumen de apuestas por usuarios.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetSummaryStatsByUserPage()))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.event,
                        title: 'Días',
                        subtitle: 'Resumen de apuestas por días.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetSummaryStatsPage(statsType: StatsType.BY_DAY)))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.today,
                        title: 'Meses',
                        subtitle: 'Resumen de apuestas por meses.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetSummaryStatsPage(statsType: StatsType.BY_MONTH)))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.date_range,
                        title: 'Años',
                        subtitle: 'Resumen de apuestas por años.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetSummaryStatsPage(statsType: StatsType.BY_YEAR)))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.wrap_text,
                        title: 'Events y días',
                        subtitle: 'Resumen de apuestas por events/días.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetSummaryStatsPage(statsType: StatsType.BY_EVENT_DAY)))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.list,
                        title: 'Events y meses',
                        subtitle: 'Resumen de apuestas por events/meses.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetSummaryStatsPage(statsType: StatsType.BY_EVENT_AND_MONTH)))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.low_priority,
                        title: 'Tipos y días',
                        subtitle: 'Resumen de apuestas por tipos/días.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetSummaryStatsPage(statsType: StatsType.BY_TYPES_DAY)))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.line_style,
                        title: 'Tipos y meses',
                        subtitle: 'Resumen de apuestas por tipos/meses.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetSummaryStatsPage(statsType: StatsType.BY_TYPES_AND_MONTH)))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.satellite,
                        title: 'Deporte',
                        subtitle: 'Resumen de apuestas por deportes.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetSummaryStatsPage(statsType: StatsType.BY_SPORT)))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.map,
                        title: 'Deporte y días',
                        subtitle: 'Resumen de apuestas por deportes/días.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetSummaryStatsPage(statsType: StatsType.BY_SPORT_AND_DAY)))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.widgets,
                        title: 'Deporte y meses',
                        subtitle: 'Resumen de apuestas por deportes/meses.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetSummaryStatsPage(statsType: StatsType.BY_SPORT_AND_MONTH)))
                        },
                      ),
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
