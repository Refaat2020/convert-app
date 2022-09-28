import 'package:currencyconverter/feature/conver_currency_feature/data/models/historical_model.dart';
import 'package:currencyconverter/feature/conver_currency_feature/data/repositories/convert_repo.dart';
import 'package:currencyconverter/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
 late ConvertRepo convertRepo;
  setUpAll((){
    setupLocator();
    convertRepo = locator<ConvertRepo>();
  });
  ///for  test fetch supported list
  test('get supported list', () async {
    var result = await convertRepo.getList();
    expect(true, result!= null);
  });


  test('get convert', () async {
    var result = await convertRepo.getConvert("USD", "EGP", "100");
    expect(true, result["result"] is double);
  });

 test('get Historical ', () async {
   HistoricalModel historicalModel;

   var result = await convertRepo.getHistorical();
   historicalModel = HistoricalModel.fromMap(result, "USDEGP");
   expect(true, historicalModel.success == true);
 });

 test('get Historical ', () async {
   HistoricalModel historicalModel;

   var result = await convertRepo.getHistorical();
   historicalModel = HistoricalModel.fromMap(result, "USDEGP");
   expect(true, historicalModel.success == true);
 });

}

