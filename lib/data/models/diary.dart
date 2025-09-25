class Diary {
  final int? id;
  final String? date;
  final String? month;
  final String? year;

  final String title;

  final String body;

  Diary({
    this.id,
    this.date,
    this.month,
    this.year,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() => {
    'date': date,
    'month': month,
    'year': year,
    'title': title,
    'body': body,
  };
  factory Diary.fromMap(Map<String, dynamic> map) => Diary(
    id: map['id'],
    date: map['date'],
    month: map['month'],
    year: map['year'],
    title: map['title'],
    body: map['body'],
  );
}
