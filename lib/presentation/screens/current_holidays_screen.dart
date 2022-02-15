import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reason_to_drink/domain/holidays/holidays_entities.dart';
import 'package:reason_to_drink/presentation/providers.dart';
import 'package:reason_to_drink/presentation/widgets/rtd_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Holidays? _holidays;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    _holidays = await holidaysRepository.getCurrentHolidays();
    if (mounted) {
      setState(() {});
    }
  }

  void _changePicker() async {
    DateTime? _value;

    await showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            minimumDate: DateTime.now(),
            maximumDate: DateTime(2100, 12, 31),
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (value) {
              _value = value;
            },
          ),
        );
      },
    );

    _holidays = await holidaysRepository.getHolidayByDate(_value!);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Праздники',
          style: TextStyle(
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined),
            onPressed: () => _changePicker(),
          ),
        ],
      ),
      body: SafeArea(
        child: _holidays == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _holidays!.names.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RTDContainer(
                          listOfHolidays: _holidays!.names,
                          index: index,
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
