import 'package:reason_to_drink/domain/holidays/holidays_entities.dart';

abstract class HolidaysRepository {
  Future<Holidays> getCurrentHolidays();
  Future<Holidays> getHolidayByDate(DateTime userDateTime);
}
