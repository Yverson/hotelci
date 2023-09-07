library weekly_date_picker;

import 'package:flutter/material.dart';
import 'package:hotel_ci/core/utils/app_color.dart';
import './date_time_picker.dart';

class WeeklyDatePicker extends StatefulWidget {
  const WeeklyDatePicker({
    Key? key,
    required this.selectedDay,
    required this.changeDay,
    this.weekdayText = 'Week',
    this.weekdays = const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    this.backgroundColor = const Color(0xFFFAFAFA),
    this.selectedBackgroundColor = const Color(0xFF2A2859),
    this.selectedDigitColor = const Color(0xFFFFFFFF),
    this.digitsColor = const Color(0xFF000000),
    this.weekdayTextColor = const Color(0xFF303030),
    this.enableWeeknumberText = true,
    this.weeknumberColor = const Color(0xFFB2F5FE),
    this.weeknumberTextColor = const Color(0xFF000000),
    this.daysInWeek = 7,
  })  : assert(weekdays.length == daysInWeek,
            "weekdays must be of length $daysInWeek"),
        super(key: key);

  /// The current selected day
  final DateTime selectedDay;

  /// Callback function with the new selected date
  final Function(DateTime) changeDay;

  /// Specifies the weekday text: default is 'Week'
  final String weekdayText;

  /// Specifies the weekday strings ['Mon', 'Tue'...]
  final List<String> weekdays;

  /// Background color
  final Color backgroundColor;

  /// Color of the selected digits text
  final Color selectedBackgroundColor;

  /// Color of the unselected digits text
  final Color selectedDigitColor;

  /// Color of the unselected digits text
  final Color digitsColor;

  /// Is the color of the weekdays 'Mon', 'Tue'...
  final Color weekdayTextColor;

  /// Set to false to hide the weeknumber textfield to the left of the slider
  final bool enableWeeknumberText;

  /// Color of the weekday container
  final Color weeknumberColor;

  /// Color of the weekday text
  final Color weeknumberTextColor;

  /// Specifies the number of weekdays to render, default is 7, so Monday to Sunday
  final int daysInWeek;

  @override
  _WeeklyDatePickerState createState() => _WeeklyDatePickerState();
}

class _WeeklyDatePickerState extends State<WeeklyDatePicker> {
  final _controller = PageController(initialPage: 0);
  // final DateTime _todaysDateTime = DateTime.now();

  late final DateTime _initialSelectedDay;
  late int weeknumberInSwipe;
  int weekIndex = 0;

  @override
  void initState() {
    super.initState();
    _initialSelectedDay = widget.selectedDay;
    weeknumberInSwipe = widget.selectedDay.weekday;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      color: widget.backgroundColor,
      child: Row(
        children: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(left: 20),
            onPressed: () {
              _controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.elasticOut);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.cyanColor,
            ),
          ),
          // widget.enableWeeknumberText
          //     ? fastOutSlowIn(
          //         padding: EdgeInsets.all(8.0),
          //         color: widget.weeknumberColor,
          //         child: Text(
          //           '${widget.weekdayText} $weeknumberInSwipe',
          //           style: TextStyle(color: widget.weeknumberTextColor),
          //         ),
          //       )
          //     : Container(),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  weekIndex = index;
                  weeknumberInSwipe = _initialSelectedDay
                      .add(Duration(days: 7 * index))
                      .weekday;
                });
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, weekOffset) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _weekdays(weekOffset),
              ),
            ),
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 20),
            onPressed: () {
              _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.elasticOut);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.cyanColor,
            ),
          )
        ],
      ),
    );
  }

  // Builds a 5 day list of DateButtons
  List<Widget> _weekdays(int weekIndex) {
    List<Widget> weekdays = [];

    for (int i = 0; i < widget.daysInWeek; i++) {
      int offset = i + 1 - _initialSelectedDay.weekday;
      DateTime dateTime =
          _initialSelectedDay.add(Duration(days: weekIndex * 7 + offset));
      weekdays.add(_dateButton(dateTime));
    }
    return weekdays;
  }

  Widget _dateButton(DateTime dateTime) {
    final String weekday = widget.weekdays[dateTime.weekday - 1];
    final bool isSelected = dateTime.isSameDateAs(widget.selectedDay);

    return Expanded(
      child: GestureDetector(
        onTap: () => widget.changeDay(dateTime),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: isSelected
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.01, 0.7],
                    colors: [
                      AppColors.gradient1,
                      AppColors.gradient2,
                    ],
                  )
                : null,
          ),
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                weekday,
                style: TextStyle(
                  fontSize: 12.0,
                  color: isSelected
                      ? widget.selectedDigitColor
                      : widget.digitsColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${dateTime.day}',
                style: TextStyle(
                  color: isSelected
                      ? widget.selectedDigitColor
                      : widget.digitsColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
