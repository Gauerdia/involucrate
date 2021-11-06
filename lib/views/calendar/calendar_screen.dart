import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:involucrate/model/project_list_data.dart';
import 'package:involucrate/views/project/show_project_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import 'utils.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  // Objects for init of calendar
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  // Objects to add events
  late final ValueNotifier<List<Event>> _selectedEvents;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;

  @override
  void initState(){
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier((_getEventsForDay(_selectedDay!)));
  }

  @override
  void dispose(){
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day){
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end){
    final days = daysInRange(start, end);

    return [
      for(final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay){
    if(!isSameDay(_selectedDay, selectedDay)){
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay){
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null){
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if( start != null){
      _selectedEvents.value = _getEventsForDay(start);
    } else if( end != null){
      _selectedEvents.value = _getEventsForDay(end);
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:30),
        child: _buildCalendar(),
      )
    );
  }

  Widget _buildCalendar(){
    return Column(
      children: [
        TableCalendar<Event>(

          // Setting variables
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          rangeStartDay: _rangeStart,
          rangeEndDay: _rangeEnd,
          rangeSelectionMode: _rangeSelectionMode,
          eventLoader: _getEventsForDay,
          startingDayOfWeek: StartingDayOfWeek.monday,
          onRangeSelected: _onRangeSelected,

          // Designing the calendar
          calendarStyle: const CalendarStyle(
            outsideDaysVisible: false
          ),

          selectedDayPredicate: (day){
            return isSameDay(_selectedDay, day);
          },

          onDaySelected: (selectedDay, focusedDay){
            _onDaySelected(selectedDay, focusedDay);

          },

          onFormatChanged: (format){
            if (_calendarFormat != format){
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay){
            _focusedDay = focusedDay;
          },
        ),
        const SizedBox(height: 8.0,),
        Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _){
                return ListView.builder(
                  itemCount: value.length,
                    itemBuilder: (context, index){
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        onTap: () {
                          print('${value[index]}');

                          ProjectListData testData = ProjectListData(
                              title: '${value[index]}',
                              topic: "politic",
                              location: "Herne",
                              creator: "Hans Wurst",
                              organiser: "private person",
                              state: 0,
                              imagePath: "assets/images/geo_abstract_bg_rose.jpg",
                              categories: ["Idea","Structure","Financing"],
                              categories_content: ["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
                                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
                                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum."]
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShowProjectScreen(projectData: testData,showCaseCreateProject: false,))
                          );
                        },
                        title: Text('${value[index]}'),
                      )
                    );
                  }
                );
              },
            )
        )
      ],
    );
  }
}

