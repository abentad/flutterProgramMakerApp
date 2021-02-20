import 'package:flutter/material.dart';
import 'package:lazy_data_table/lazy_data_table.dart';
import 'package:programMaker/days_model.dart';
import 'package:programMaker/logger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProgramMaker',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoggerScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final List<DaysModel> daysClasses;
  HomeScreen({@required this.daysClasses});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  List<String> periods = ["1-2", "3-4", "5-6", "7-8"];

  var headerStyle = TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: LazyDataTable(
            rows: 6,
            columns: 4,
            tableDimensions: LazyDataTableDimensions(
              cellHeight: height * 0.135,
              cellWidth: width * 0.22,
              columnHeaderHeight: 50,
              rowHeaderWidth: 75,
            ),
            columnHeaderBuilder: (i) {
              return Center(child: Text("${periods[i]}", style: headerStyle));
            },
            rowHeaderBuilder: (i) => Center(
                child: Text("${days[i]}",
                    style: headerStyle.copyWith(fontSize: 14.0))),
            dataCellBuilder: (i, j) => Center(
                child: Text(
                    "${widget.daysClasses[i].classes[j].className}\n${widget.daysClasses[i].classes[j].classNumber}")),
            cornerWidget: Center(child: Text("")),
          ),
        ),
      ),
    );
  }
}

// LazyDataTable(
//             rows: 6,
//             columns: 4,
//             tableDimensions: LazyDataTableDimensions(
//               cellHeight: height * 0.135,
//               cellWidth: width * 0.22,
//               columnHeaderHeight: 50,
//               rowHeaderWidth: 75,
//             ),
//             columnHeaderBuilder: (i) {
//               return Center(child: Text("${periods[i]}", style: headerStyle));
//             },
//             rowHeaderBuilder: (i) => Center(
//                 child: Text("${days[i]}",
//                     style: headerStyle.copyWith(fontSize: 14.0))),
//             dataCellBuilder: (i, j) => Center(
//                 child: Text(
//                     "${widget.classes[i + 3].className}\n${widget.classes[i].classNumber},$i,$j")),
//             cornerWidget: Center(child: Text("")),
//           ),
