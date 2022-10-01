// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';
// import 'package:fuel_trucks/Constant.dart';
// import 'model.dart';
//
// class DetailsFRM extends StatelessWidget {
//   DetailsFRM({Key? key}) : super(key: key);
//   final List<BarChartModel> data = [
//     BarChartModel(
//       year: "Frequency",
//       financial: 1000,
//       color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
//     ),
//     BarChartModel(
//       year: "Recency",
//       financial: 3000,
//       color: charts.ColorUtil.fromDartColor(Colors.red),
//     ),
//     BarChartModel(
//       year: "Monetary",
//       financial: 1500,
//       color: charts.ColorUtil.fromDartColor(Colors.green),
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<BarChartModel, String>> series = [
//       charts.Series(
//         id: "financial",
//         data: data,
//         domainFn: (BarChartModel series, _) => series.year,
//         measureFn: (BarChartModel series, _) => series.financial,
//         colorFn: (BarChartModel series, _) => series.color,
//       ),
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Bar Chart" , style: TextStyle(color: Colors.black),),
//         centerTitle: true,
//         backgroundColor: primaryColor,
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
//         child: charts.BarChart(
//           series,
//           animate: true,
//         ),
//       ),
//     );
//   }
// }
