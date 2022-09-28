import 'package:objectbox/objectbox.dart';

import '../../feature/conver_currency_feature/data/models/list_supported_country_model.dart';
import '../../objectbox.g.dart';

class ObjectBox{

  late final Store _store;
  late final Box<ListSupportedCountryModel>supportedCountry;

  ObjectBox._init(this._store){
    supportedCountry = Box<ListSupportedCountryModel>(_store);

  }

  static Future<ObjectBox>init()async{
  final store = await openStore();

  return ObjectBox._init(store);
 }


  int insertList(ListSupportedCountryModel currency) => supportedCountry.put(currency);

}