class HistoricalModel{

  late  final  bool success;
  late  final  bool historical;
  late  final  String date;
  late  final  String source;
  late  final  Quotes quotes;

  HistoricalModel(
      {required this.success, required this.historical,required this.date, required this.source,required this.quotes});

  factory HistoricalModel.fromMap(dynamic map,String currency) {
    return HistoricalModel(
      success: map['success'],
      historical: map['historical'],
      date: map['date'].toString(),
      source: map['source'].toString(),
      quotes: Quotes.fromMap(map['quotes'],currency),
    );
  }
}

class Quotes{
  late  final String currency;

  Quotes({required this.currency});

  factory Quotes.fromMap(dynamic map,String currency) {
    return Quotes(
      currency: map[currency].toString(),
    );
  }
}