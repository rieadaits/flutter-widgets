import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  return runApp(MyApp());
}

/// My app class to display the date range picker
class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

/// State for MyApp
class MyAppState extends State<MyApp> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('DatePicker demo'),
      ),
      body: SizedBox(
        height: 200,
        child: SfDateRangePicker(
          onSelectionChanged: _onSelectionChanged,
          selectionMode: DateRangePickerSelectionMode.single,
          monthViewSettings: const DateRangePickerMonthViewSettings(
              dayFormat: 'EEE',
              firstDayOfWeek: 1,
              showTrailingAndLeadingDates: true,
              viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  textStyle: TextStyle(
                color: Color(0xff5E5E5E),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )),
              numberOfWeeksInView: 1),
          monthCellStyle: const DateRangePickerMonthCellStyle(
              todayTextStyle: TextStyle(
                color: Color(0xff5E5E5E),
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
              todayCellDecoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.rectangle,
                border: Border(
                  bottom: BorderSide(
                    width: 3.0,
                    color: Color(0xff3161F1),
                  ),
                ),
              ),
              textStyle: TextStyle(
                color: Color(0xff5E5E5E),
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
              disabledDatesTextStyle: TextStyle(
                color: Color(0xffC3C9D7),
                fontSize: 17,
                fontWeight: FontWeight.w700,
              )),
        ),
      ),
    ));
  }
}
