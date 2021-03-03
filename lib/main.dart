import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'confirm_button.dart';
import 'party_date_appbar.dart';

class CalenderWidget extends StatefulWidget {
  BuildContext context;
  BoxConstraints constraints;
//  CalenderWidget(this.context, this.constraints);

  CalenderWidget({Key key, this.title, this.context, this.constraints})
      : super(key: key);
  final String title;
  @override
  _CalenderWidgetState createState() =>
      new _CalenderWidgetState(context, constraints);
}

class _CalenderWidgetState extends State<CalenderWidget> {
  BuildContext context;
  BoxConstraints constraints;
  _CalenderWidgetState(this.context, this.constraints);
  DateTime _currentDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime _currentDate2 =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String _currentMonth = DateFormat.yMMM().format(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
  DateTime _targetDateTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  EventList<Event> _markedDateMap = new EventList<Event>(events: {});
  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
      },
      weekendTextStyle: TextStyle(
        color: Colors.grey,
      ),
      thisMonthDayBorderColor: Colors.grey,
      headerText: 'Custom Header',
      weekFormat: true,
      markedDatesMap: _markedDateMap,
      height: 200.0,
      selectedDateTime: _currentDate2,
      showIconBehindDayText: true,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      selectedDayTextStyle: TextStyle(
        color: Colors.orange,
      ),
      todayTextStyle: TextStyle(
        color: Colors.orange,
      ),
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      todayButtonColor: Colors.orange,
      todayBorderColor: Colors.orange,
      markedDateMoreShowTotal: true,
    );
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      nextDaysTextStyle: TextStyle(fontSize: 0),
      selectedDayBorderColor: Colors.orange,
      selectedDayButtonColor: Colors.orange,
      todayBorderColor: Colors.grey[50],
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
      },
      weekdayTextStyle: TextStyle(color: Colors.black),
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: true,
      weekendTextStyle: TextStyle(
        color: Color(0xFFbec4cf),
      ),
      thisMonthDayBorderColor: Colors.white,
      weekFormat: false,
      daysTextStyle: TextStyle(color: Color(0xFFbec4cf)), //wichtig
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: Colors.orange)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.black,
      ),
      todayButtonColor: Colors.grey[50],
      selectedDayTextStyle: TextStyle(
        color: Colors.white,
      ),
      minSelectedDate: _currentDate,
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 0,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.white,
          height: 60,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Icon(
                  Icons.calendar_today,
                  color: Color(0xFFc4c9d1),
                  size: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0),
                child: Text(
                  _currentDate2.toString()[8] +
                      _currentDate2.toString()[9] +
                      '.' +
                      _currentDate2.toString()[5] +
                      _currentDate2.toString()[6] +
                      '.' +
                      _currentDate2.toString()[0] +
                      _currentDate2.toString()[1] +
                      _currentDate2.toString()[2] +
                      _currentDate2.toString()[3],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.grey[50],
          height: 30,
        ),

        Container(
          margin: EdgeInsets.only(
            top: 30.0,
            bottom: 16.0,
            left: 1.0,
            right: 16.0,
          ),
          child: new Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 50),
                    child: Row(
                      children: [
                        Icon(
                          Icons.west,
                          color: Color(0xFFc1c8cc),
                          size: 20,
                        ),
                        Text(
                          'prev.',
                          style: TextStyle(
                            color: Color(0xFFc1c8cc),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _targetDateTime = DateTime(
                          _targetDateTime.year, _targetDateTime.month - 1);
                      _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      _currentMonth,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    )),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(
                        left: 55,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'next',
                            style: TextStyle(
                                color: Color(0xFFc1c8cc), fontSize: 18),
                          ),
                          Icon(
                            Icons.east,
                            color: Color(0xFFc1c8cc),
                            size: 20,
                          ),
                        ],
                      )),
                  onTap: () {
                    setState(() {
                      _targetDateTime = DateTime(
                          _targetDateTime.year, _targetDateTime.month + 1);
                      _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                    });
                  },
                ),
              )
            ],
          ),
        ),
        Container(
          height: constraints.maxHeight * 0.45,
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: _calendarCarouselNoHeader,
        ), //
      ],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          //primarySwatch: Colors.grey[100],
          ),
      home: Builder(
        builder: (context) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(65), child: PartyDateAppBar()),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      color: Color(0xFFc2c6d2),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[50],
                  height: constraints.maxHeight * 0.009,
                ),
                Container(
                  color: Colors.white,
                  child: CalenderWidget(
                    context: context,
                    constraints: constraints,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                ConfirmButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
