import 'package:flutter/material.dart';
import 'package:reason_to_drink/parser/parser.dart';
import 'package:reason_to_drink/widgets/rtd_container.dart';
import 'package:reason_to_drink/widgets/rtd_divider.dart';
import 'package:reason_to_drink/widgets/text_with_border.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> listOfHolidays = <String>[];
  @override
  void initState() {
    super.initState();
    initStateAsync();
  }

  Future<void> initStateAsync() async {
    final listOfHolidays = await parseHtml();
    setState(() => this.listOfHolidays = listOfHolidays);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfHolidays == []
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: <Widget>[
                  const TextWithBorder(
                    text: 'Праздники',
                    fontSize: 45,
                    borderWidth: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: RTDDivider(),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listOfHolidays.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RTDContainer(
                          borderColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.grey
                                  : Colors.black,
                          listOfHolidays: listOfHolidays,
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
