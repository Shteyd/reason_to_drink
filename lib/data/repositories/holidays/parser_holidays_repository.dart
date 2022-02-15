import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:reason_to_drink/data/constants.dart';

import 'package:reason_to_drink/domain/holidays/holidays_entities.dart';
import 'package:reason_to_drink/domain/holidays/holidays_perository.dart';

class ParserHolidaysRepository extends HolidaysRepository {
  @override
  Future<Holidays> getCurrentHolidays() async {
    return _requestOnWebsite('https://kakoysegodnyaprazdnik.ru/');
  }

  @override
  Future<Holidays> getHolidayByDate(DateTime userDateTime) async {
    final int day = userDateTime.day;
    final String month = monthName(userDateTime.month);

    return _requestOnWebsite(
        'https://kakoysegodnyaprazdnik.ru/baza/$month/$day');
  }

  Future<Holidays> _requestOnWebsite(String url) async {
    final response = await get(Uri.parse(url), headers: {
      'user-agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36 Edg/98.0.1108.50',
    });

    const String checkElement = '<span itemprop="text">';

    final body = utf8.decode(response.bodyBytes);
    final elements = parse(body).getElementsByClassName('main');
    final List<String> _listOfHolidays = [];

    for (int i = 0; i < elements.length; i++) {
      final String element;
      if (elements[i].children[0].innerHtml.indexOf(checkElement) == 0) {
        element = elements[i].children[0].children[0].innerHtml;
      } else {
        element = elements[i].children[0].innerHtml;
      }
      _listOfHolidays.add(element);
    }

    return Holidays(names: _listOfHolidays);
  }
}
