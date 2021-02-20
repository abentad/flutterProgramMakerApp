import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programMaker/class_model.dart';
import 'package:programMaker/days_model.dart';
import 'package:programMaker/main.dart';

class LoggerScreen extends StatefulWidget {
  @override
  _LoggerScreenState createState() => _LoggerScreenState();
}

class _LoggerScreenState extends State<LoggerScreen> {
  List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  List<String> periods = ["1-2", "3-4", "5-6", "7-8"];

  int selectedDay = 0;
  int selectedPeriod = 0;

  List<ClassModel> monClasses = [];
  List<ClassModel> tueClasses = [];
  List<ClassModel> wedClasses = [];
  List<ClassModel> thuClasses = [];
  List<ClassModel> friClasses = [];
  List<ClassModel> satClasses = [];

  List<DaysModel> daysList = [];

  TextEditingController _classNameController = TextEditingController();
  TextEditingController _classNumberController = TextEditingController();

  void incrementSelectedDay() {
    setState(() {
      if (selectedDay < days.length - 1) {
        selectedDay++;
      } else if (selectedDay == days.length - 1) {
        print(monClasses.length);

        addDaysList();

        Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (context) => HomeScreen(daysClasses: daysList)));
      }
    });
  }

  void addDaysList() {
    DaysModel monClassess = DaysModel(classes: monClasses);
    daysList.add(monClassess);
    print('added');
    DaysModel tueClassess = DaysModel(classes: tueClasses);
    daysList.add(tueClassess);
    DaysModel wedClassess = DaysModel(classes: wedClasses);
    daysList.add(wedClassess);
    DaysModel thuClassess = DaysModel(classes: thuClasses);
    daysList.add(thuClassess);
    DaysModel friClassess = DaysModel(classes: friClasses);
    daysList.add(friClassess);
    DaysModel satClassess = DaysModel(classes: satClasses);
    daysList.add(satClassess);
    print(daysList.length);
  }

  void incrementSelectedPeriod() {
    setState(() {
      if (selectedPeriod < periods.length - 1) {
        selectedPeriod++;
      } else if (selectedPeriod == periods.length - 1) {
        selectedPeriod = 0;
        incrementSelectedDay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Class Name \nAnd Room Number for\n\n${days[selectedDay]}   ${periods[selectedPeriod]}',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20.0),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _classNameController,
                      decoration: InputDecoration(
                        hintText: "Class Name",
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _classNumberController,
                      decoration: InputDecoration(
                        hintText: "Room Number",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      ClassModel newClass = ClassModel(
                        className: "",
                        classNumber: "",
                      );
                      switch (selectedDay) {
                        case 0:
                          monClasses.add(newClass);
                          break;
                        case 1:
                          tueClasses.add(newClass);
                          break;
                        case 2:
                          wedClasses.add(newClass);
                          break;
                        case 3:
                          thuClasses.add(newClass);
                          break;
                        case 4:
                          friClasses.add(newClass);
                          break;
                        case 5:
                          satClasses.add(newClass);
                          break;
                        default:
                      }
                      // if (selectedPeriod == periods.length - 1) {
                      //   DaysModel daysClass = DaysModel(classes: classes);
                      //   daysList.add(daysClass);
                      //   // classes.clear();
                      // }
                      incrementSelectedPeriod();
                    },
                    child: Text('Skip', style: TextStyle(color: Colors.white)),
                    color: Colors.teal,
                  ),
                  MaterialButton(
                    onPressed: () {
                      ClassModel newClass = ClassModel(
                        className: _classNameController.text,
                        classNumber: _classNumberController.text,
                      );
                      switch (selectedDay) {
                        case 0:
                          monClasses.add(newClass);
                          break;
                        case 1:
                          tueClasses.add(newClass);
                          break;
                        case 2:
                          wedClasses.add(newClass);
                          break;
                        case 3:
                          thuClasses.add(newClass);
                          break;
                        case 4:
                          friClasses.add(newClass);
                          break;
                        case 5:
                          satClasses.add(newClass);
                          break;
                        default:
                      }

                      // if (selectedPeriod == periods.length - 1) {
                      //   DaysModel daysClass = DaysModel(classes: classes);
                      //   daysList.add(daysClass);
                      //   // classes.clear();
                      // }

                      print('class added');
                      incrementSelectedPeriod();
                    },
                    child: Text('Place', style: TextStyle(color: Colors.white)),
                    color: Colors.teal,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
