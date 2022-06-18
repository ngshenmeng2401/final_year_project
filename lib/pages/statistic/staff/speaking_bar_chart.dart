import 'package:final_year_project/pages/statistic/staff/indicator.dart';
import 'package:final_year_project/pages/statistic/staff/statstic_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpeakingBarGraph extends StatelessWidget {

  final statisticsController = Get.put(StatisticsController());

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 1.1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff2c4260),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    width: 38,
                  ),
                  const Text(
                    'Speaking',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    'Result',
                    style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    '(SR)',
                    style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 38,
              ),
              Expanded(
                child: GetBuilder<StatisticsController>(
                  init: StatisticsController(),
                  builder: (controller) {
                    return BarChart(
                      BarChartData(
                        maxY: 10,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.grey,
                            getTooltipItem: (_a, _b, _c, _d) => null,
                          )
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: bottomTitles,
                              reservedSize: 42,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 28,
                              interval: 1,
                              getTitlesWidget: leftTitles,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: statisticsController.showingBarGroups3,
                        gridData: FlGridData(show: false),
                      ),
                    );
                  },
                ),
              ),
              Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Indicator(
                  color: Color(0xff53fdd7),
                  text: "Level 1",
                  isSquare: false,
                  size: statisticsController.touchedIndex == 0 ? 18 : 16,
                  textColor: Colors.white,
                ),
                Indicator(
                  color: Color(0xffff5182),
                  text: "Level 2",
                  isSquare: false,
                  size: statisticsController.touchedIndex == 1 ? 18 : 16,
                  textColor: Colors.white,
                ),
                Indicator(
                  color: Color(0xFFE7E73A),
                  text: "Level 3",
                  isSquare: false,
                  size: statisticsController.touchedIndex == 2 ? 18 : 16,
                  textColor: Colors.white,
                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 10) {
      text = '10';
    } else if (value == 50) {
      text = '50';
    } else {
      return Container();
    }
    return Text(text, style: style);
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text(
          'SR 1',
          style: style,
        );
        break;
      case 1:
        text = const Text(
          'SR 2',
          style: style,
        );
        break;
      case 2:
        text = const Text(
          'SR 3',
          style: style,
        );
        break;
      case 3:
        text = const Text(
          'SR 4',
          style: style,
        );
        break;
      case 4:
        text = const Text(
          'SR 5',
          style: style,
        );
        break;
      default:
        text = const Text(
          '',
          style: style,
        );
        break;
    }
    return Padding(padding: const EdgeInsets.only(top: 20), child: text);
  }
}