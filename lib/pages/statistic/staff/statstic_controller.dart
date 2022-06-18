import 'package:final_year_project/model/listening_summary.dart';
import 'package:final_year_project/model/reading_summary.dart';
import 'package:final_year_project/model/speaking_summary.dart';
import 'package:final_year_project/model/summary_data.dart';
import 'package:final_year_project/model/total_level.dart';
import 'package:final_year_project/model/writing_summary.dart';
import 'package:final_year_project/service/staff/statistic_remote_services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController{

  var touchedIndex = 0;

  final Color lvl1BarColor =Color(0xff53fdd7);
  final Color lvl2BarColor =Color(0xffff5182);
  final Color lvl3BarColor =Color(0xFFE7E73A);
  final double width = 10;

  late List<BarChartGroupData> rawBarGroups1, rawBarGroups2, rawBarGroups3, rawBarGroups4;
  
  late List<BarChartGroupData> showingBarGroups1, showingBarGroups2, showingBarGroups3, showingBarGroups4;

  int touchedGroupIndex = -1;

  var summaryDataList = <SummaryData>[].obs;
  var listeningSummaryList = <ListeningSummary>[];
  var readingSummaryList = <ReadingSummary>[];
  var speakingSummaryList = <SpeakingSummary>[];
  var writingSummaryList = <WritingSummary>[];
  var totalLevel = <TotalLevel>[];
  var statusMsj = "Loading".obs;

  var totalStudent = 0.obs, totalClass = 0.obs, totalRecord = 0.obs, totalParent = 0.obs;
  var totalLevel1 , totalLevel2 , totalLevel3;

  late double totalQ1Lvl1, totalQ1Lvl2, totalQ1Lvl3;
  late double totalQ2Lvl1, totalQ2Lvl2, totalQ2Lvl3;
  late double totalQ3Lvl1, totalQ3Lvl2, totalQ3Lvl3;
  late double totalQ4Lvl1, totalQ4Lvl2, totalQ4Lvl3; 

  var barGroup1 = new BarChartGroupData(x: 1,);
  var barGroup2 = new BarChartGroupData(x: 1,);
  var barGroup3 = new BarChartGroupData(x: 1,);
  var barGroup4 = new BarChartGroupData(x: 1,);
  var barGroup5 = new BarChartGroupData(x: 1,);

  @override
  void onInit() {

    barGroup1 = makeGroupData(0, 0, 1, 0);
    barGroup2 = makeGroupData(1, 0, 0, 0);
    barGroup3 = makeGroupData(2, 0, 0, 0);
    barGroup4 = makeGroupData(3, 0, 0, 0);
    barGroup5 = makeGroupData(3, 1, 0, 1);

    final listeningitems = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
    ];

    final readingitems = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
    ];

    final speakingitems = [
        barGroup1,
        barGroup2,
        barGroup3,
        barGroup4,
        barGroup5,
    ];

    final writingitems = [
        barGroup1,
        barGroup2,
    ];

    rawBarGroups1 = listeningitems;
    rawBarGroups2 = readingitems;
    rawBarGroups3 = speakingitems;
    rawBarGroups4 = writingitems;

    showingBarGroups1 = rawBarGroups1;
    showingBarGroups2 = rawBarGroups2;
    showingBarGroups3 = rawBarGroups3;
    showingBarGroups4 = rawBarGroups4;

    super.onInit();

    loadSummaryDataList();
    loadListeningSummaryList();
    loadReadingSummaryList();
    loadSpeakingSummaryList();
    loadWritingSummaryList();
    loadTotalLevel();
  }

  void loadSummaryDataList() async{

    var summaryData = await StatisticsRemoteService.fetchSummaryData();
    if (summaryData != null) {
      summaryDataList.assignAll(summaryData);

      totalStudent.value = summaryDataList[0].totalstudent!;
      totalClass.value = summaryDataList[0].totalclass!;
      totalRecord.value = summaryDataList[0].totalrecord!;
      totalParent.value = summaryDataList[0].totalparent!;

    } else {
      statusMsj("No any class".tr);
    }
    
  }

  void loadListeningSummaryList() async{

    var listeningSummary = await StatisticsRemoteService.fetchListeningSummary();
    if (listeningSummary != null) {
      listeningSummaryList.assignAll(listeningSummary);

      barGroup1 = makeGroupData(0, listeningSummaryList[0].totalq1Lvl1!.toDouble(), listeningSummaryList[0].totalq1Lvl2!.toDouble(), listeningSummaryList[0].totalq1Lvl3!.toDouble());
      barGroup2 = makeGroupData(1, listeningSummaryList[0].totalq2Lvl1!.toDouble(), listeningSummaryList[0].totalq2Lvl2!.toDouble(), listeningSummaryList[0].totalq2Lvl3!.toDouble());
      barGroup3 = makeGroupData(2, listeningSummaryList[0].totalq3Lvl1!.toDouble(), listeningSummaryList[0].totalq3Lvl2!.toDouble(), listeningSummaryList[0].totalq3Lvl3!.toDouble());
      barGroup4 = makeGroupData(3, listeningSummaryList[0].totalq4Lvl1!.toDouble(), listeningSummaryList[0].totalq4Lvl2!.toDouble(), listeningSummaryList[0].totalq4Lvl3!.toDouble());

      final listeningitems = [
        barGroup1,
        barGroup2,
        barGroup3,
        barGroup4,
      ];

      rawBarGroups1 = listeningitems;
      showingBarGroups1 = rawBarGroups1;
      
    } else {
      statusMsj("No any statistic".tr);
    }
    update();
    
  }

  void loadReadingSummaryList() async{

    var readingSummary = await StatisticsRemoteService.fetchReadingSummary();
    if (readingSummary != null) {
      readingSummaryList.assignAll(readingSummary);

      barGroup1 = makeGroupData(0, readingSummaryList[0].totalq1Lvl1!.toDouble(), readingSummaryList[0].totalq1Lvl2!.toDouble(), readingSummaryList[0].totalq1Lvl3!.toDouble());
      barGroup2 = makeGroupData(1, readingSummaryList[0].totalq2Lvl1!.toDouble(), readingSummaryList[0].totalq2Lvl2!.toDouble(), readingSummaryList[0].totalq2Lvl3!.toDouble());
      barGroup3 = makeGroupData(2, readingSummaryList[0].totalq3Lvl1!.toDouble(), readingSummaryList[0].totalq3Lvl2!.toDouble(), readingSummaryList[0].totalq3Lvl3!.toDouble());
      barGroup4 = makeGroupData(3, readingSummaryList[0].totalq4Lvl1!.toDouble(), readingSummaryList[0].totalq4Lvl2!.toDouble(), readingSummaryList[0].totalq4Lvl3!.toDouble());

      final readingitems = [
        barGroup1,
        barGroup2,
        barGroup3,
        barGroup4,
      ];

      rawBarGroups2 = readingitems;
      showingBarGroups2 = rawBarGroups2;
      
    } else {
      statusMsj("No any statistic".tr);
    }
    update();
    
  }

  void loadSpeakingSummaryList() async{

    var speakingSummary = await StatisticsRemoteService.fetchSpeakingSummary();
    if (speakingSummary != null) {
      speakingSummaryList.assignAll(speakingSummary);

      barGroup1 = makeGroupData(0, speakingSummaryList[0].totalq1Lvl1!.toDouble(), speakingSummaryList[0].totalq1Lvl2!.toDouble(), speakingSummaryList[0].totalq1Lvl3!.toDouble());
      barGroup2 = makeGroupData(1, speakingSummaryList[0].totalq2Lvl1!.toDouble(), speakingSummaryList[0].totalq2Lvl2!.toDouble(), speakingSummaryList[0].totalq2Lvl3!.toDouble());
      barGroup3 = makeGroupData(2, speakingSummaryList[0].totalq3Lvl1!.toDouble(), speakingSummaryList[0].totalq3Lvl2!.toDouble(), speakingSummaryList[0].totalq3Lvl3!.toDouble());
      barGroup4 = makeGroupData(3, speakingSummaryList[0].totalq4Lvl1!.toDouble(), speakingSummaryList[0].totalq4Lvl2!.toDouble(), speakingSummaryList[0].totalq4Lvl3!.toDouble());
      barGroup5 = makeGroupData(4, speakingSummaryList[0].totalq5Lvl1!.toDouble(), speakingSummaryList[0].totalq5Lvl2!.toDouble(), speakingSummaryList[0].totalq5Lvl3!.toDouble());

      final speakingitems = [
        barGroup1,
        barGroup2,
        barGroup3,
        barGroup4,
        barGroup5,
      ];

      rawBarGroups3 = speakingitems;
      showingBarGroups3 = rawBarGroups3;
      
    } else {
      statusMsj("No any statistic".tr);
    }
    update();
    
  }

  void loadWritingSummaryList() async{

    var writingSummary = await StatisticsRemoteService.fetchWritingSummary();
    if (writingSummary != null) {
      writingSummaryList.assignAll(writingSummary);

      barGroup1 = makeGroupData(0, writingSummaryList[0].totalq1Lvl1!.toDouble(), writingSummaryList[0].totalq1Lvl2!.toDouble(), writingSummaryList[0].totalq1Lvl3!.toDouble());
      barGroup2 = makeGroupData(1, writingSummaryList[0].totalq2Lvl1!.toDouble(), writingSummaryList[0].totalq2Lvl2!.toDouble(), writingSummaryList[0].totalq2Lvl3!.toDouble());

      final writingitems = [
        barGroup1,
        barGroup2,
    ];

      rawBarGroups4 = writingitems;
      showingBarGroups4 = rawBarGroups4;
      
    } else {
      statusMsj("No any statistic".tr);
    }
    update();
    
  }

  void loadTotalLevel() async{

    var totallevel = await StatisticsRemoteService.fetchTotalLevel();
    if (totallevel != null) {
      totalLevel.assignAll(totallevel);

      totalLevel1 = totalLevel[0].totallvl1!.toDouble();
      totalLevel2 = totalLevel[0].totallvl2!.toDouble();
      totalLevel3 = totalLevel[0].totallvl3!.toDouble();

    } else {
      statusMsj("No any class".tr);
    }
    update();
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(
      barsSpace: 4, x: x, barRods: [
        BarChartRodData(
          toY: y1,
          color: lvl1BarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: lvl2BarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y3,
          color: lvl3BarColor,
          width: width,
        ),
      ]
    );
  }
}
