import 'package:final_year_project/pages/statistic/staff/indicator.dart';
import 'package:final_year_project/pages/statistic/staff/statstic_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PieChartWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    int touchedIndex = 0;

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return AspectRatio(
      aspectRatio: 1.2,
      child: Card(
        color: Colors.white,
        child: Column(
          children:[
            Text("Total of Level",
              style: TextStyle(fontSize: 22,)),
            SizedBox(height: 10,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Indicator(
                  color: Colors.blue,
                  text: "Level 1",
                  isSquare: false,
                  size: touchedIndex == 0 ? 18 : 16,
                  textColor: touchedIndex == 0
                    ? Colors.black
                    : Colors.grey,
                ),
                Indicator(
                  color: Colors.red,
                  text: "Level 2",
                  isSquare: false,
                  size: touchedIndex == 1 ? 18 : 16,
                  textColor: touchedIndex == 1
                    ? Colors.black
                    : Colors.grey,
                ),
                Indicator(
                  color: Colors.yellow,
                  text: "Level 3",
                  isSquare: false,
                  size: touchedIndex == 2 ? 18 : 16,
                  textColor: touchedIndex == 2
                    ? Colors.black
                    : Colors.grey,
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),

            // Pie chart
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: GetBuilder<StatisticsController>(
                  init: StatisticsController(),
                  builder: (controller) {
                    return PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          
                        }),
                        startDegreeOffset: 270,
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 1,
                        centerSpaceRadius: screenWidth/12,
                        sections: List.generate(
                          3,
                          (index) {
                            final isTouched = index == touchedIndex;
                            final double opacity = isTouched ? 1 : 0.6;

                            // Condition
                            switch (index) {
                              case 0:
                                return PieChartSectionData(
                                  color: Colors.blue.withOpacity(opacity),
                                  value: controller.totalLevel1,
                                  title: controller.totalLevel1.toString(),
                                  radius: 80,
                                  titleStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  titlePositionPercentageOffset: 0.55,
                                );
                              case 1:
                                return PieChartSectionData(
                                  color: Colors.red.withOpacity(opacity),
                                  value: controller.totalLevel2,
                                  title: controller.totalLevel2.toString(),
                                  radius: 80,
                                  titleStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),
                                  titlePositionPercentageOffset: 0.55,
                                );
                              case 2:
                                return PieChartSectionData(
                                  color: Colors.yellow.withOpacity(opacity),
                                  value: controller.totalLevel3,
                                  title: controller.totalLevel3.toString(),
                                  radius: 80,
                                  titleStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),
                                  titlePositionPercentageOffset: 0.55,
                                );
                              default:
                                return PieChartSectionData();
                            }
                          }
                        )
                      ),
                    );
                  }),
              )
            )
          ],
        ),
      ),
    );
  }
}