import 'package:objectbox/objectbox.dart';

@Entity()
class ListSupportedCountryModel{
  int id;
  List<String>supportedCurrencies;

  ListSupportedCountryModel({this.id = 0,required this.supportedCurrencies});

}