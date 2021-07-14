import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart';

Future<List<String>> parseHtml() async {
  final response =
      await get(Uri.parse("https://kakoysegodnyaprazdnik.ru/"), headers: {});

  if (response.statusCode == 200) {
    const String checkElement = '<span itemprop="text">';

    final body = utf8.decode(response.bodyBytes);
    final elements = parse(body).getElementsByClassName('main');
    final count = elements.length;
    final List<String> listOfHolidays = [];

    for (int i = 0; i < count; i++) {
      final String element;
      if (elements[i].children[0].innerHtml.indexOf(checkElement) == 0) {
        element = elements[i].children[0].children[0].innerHtml;
      } else {
        element = elements[i].children[0].innerHtml;
      }
      listOfHolidays.add(element);
    }

    return listOfHolidays;
  } else {
    throw Exception();
  }
}
