class Common {
  static String getBallColor(String num) {
    List<int> redBall = [
      3,
      4,
      9,
      10,
      14,
      15,
      20,
      25,
      26,
      31,
      36,
      37,
      41,
      42,
      47,
      48
    ];
    List<int> greenBall = [
      5,
      6,
      11,
      16,
      17,
      21,
      22,
      27,
      28,
      32,
      33,
      38,
      39,
      43,
      44,
      49
    ];

    int parsedNum = int.parse(num);

    if (redBall.contains(parsedNum)) {
      return 'red';
    }

    if (greenBall.contains(parsedNum)) {
      return 'green';
    }

    return 'blue';
  }

  static String dateDetailFmt(String dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) {
      return ' 年 月 日 星期 点 分';
    }

    final dateObj =
        DateTime.fromMillisecondsSinceEpoch(int.parse(dateTimeString) * 1000);

    final year = dateObj.year;
    final month = dateObj.month;
    final day = dateObj.day;
    final dayOfWeek = ["日", "一", "二", "三", "四", "五", "六"][dateObj.weekday - 1];
    final hours = dateObj.hour;
    final minutes = dateObj.minute;

    return '$year年$month月$day日 星期$dayOfWeek $hours点$minutes分';
  }

  static String dateMDFmt(String dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) {
      return ' 月 日';
    }

    DateTime dateObj =
        DateTime.fromMillisecondsSinceEpoch(int.parse(dateTimeString) * 1000);

    int month = dateObj.month;
    int day = dateObj.day;

    return '$month月$day日';
  }
}
