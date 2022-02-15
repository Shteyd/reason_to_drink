String monthName(int month) {
  switch (month) {
    case 1:
      return 'yanvar';
    case 2:
      return 'fevral';
    case 3:
      return 'mart';
    case 4:
      return 'aprel';
    case 5:
      return 'may';
    case 6:
      return 'iyun';
    case 7:
      return 'iyul';
    case 8:
      return 'avgust';
    case 9:
      return 'sentyabr';
    case 10:
      return 'oktyabr';
    case 11:
      return 'noyabr';
    case 12:
      return 'dekabr';
    default:
      throw Exception('');
  }
}
