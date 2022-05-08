import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_year_project/pages/statistic/staff/listening_bar_chart.dart';
import 'package:final_year_project/pages/statistic/staff/pie_chart.dart';
import 'package:final_year_project/pages/statistic/staff/reading_bar_chart.dart';
import 'package:final_year_project/pages/statistic/staff/speaking_bar_chart.dart';
import 'package:final_year_project/pages/statistic/staff/summary_data.dart';
import 'package:final_year_project/pages/statistic/staff/writing_bar_graph.dart';
import 'package:flutter/material.dart';

class StatisticView extends StatelessWidget {
  const StatisticView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: [
                SummaryData(),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    ListeningBarGraph(),
                    ReadingBarGraph(),
                    SpeakingBarGraph(),
                    WritingBarGraph(),
                  ],
                ),
                PieChartWidget(),
              ],
            ),
          ),
        ));
  }
}
