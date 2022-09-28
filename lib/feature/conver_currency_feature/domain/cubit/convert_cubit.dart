import 'package:bloc/bloc.dart';
import 'package:currencyconverter/feature/conver_currency_feature/data/models/historical_model.dart';
import 'package:currencyconverter/feature/conver_currency_feature/data/models/list_supported_country_model.dart';
import 'package:currencyconverter/feature/conver_currency_feature/data/repositories/convert_repo.dart';
import 'package:currencyconverter/locator.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../main.dart';

part 'convert_state.dart';

class ConvertCubit extends Cubit<ConvertState> {
  ConvertCubit() : super(ConvertInitial());

  List<String> currentis = [];

  final ConvertRepo _convertRepo = locator<ConvertRepo>();
  String? from;
  String? to;
  double?result;
  HistoricalModel ?historicalModel;
  TextEditingController amountTextController = TextEditingController();
  void init(){
    if (objectbox.supportedCountry.isEmpty()) {
     getAllListSupported();
    }else{
    getSavedList();
    }
    getHistoricalData();
  }
  Future<void> getAllListSupported() async {
    emit(ConvertLoading());
    var result = await _convertRepo.getList();
    currentis = (result["currencies"].keys).toList();
    final listSupportedCountryModel = ListSupportedCountryModel(
    supportedCurrencies: currentis
    );
    int id = objectbox.insertList(listSupportedCountryModel);
    currentis = objectbox.supportedCountry.get(id)!.supportedCurrencies;
    emit(ConvertDone());
  }

  void getSavedList(){
  currentis = objectbox.supportedCountry.getAll().first.supportedCurrencies;
  // emit(ConvertDone());
  }

  void saveValue(String value, bool fromCurrency) {
    if (fromCurrency == true) {
      from = value;
    } else {
      to = value;
    }
    emit(ConvertDone());
  }

  Future<void> convert() async {
    var convertResult = await _convertRepo.getConvert(from!, to!, amountTextController.text);
    result = convertResult["result"];
    emit(ConvertDone());
  }

  Future<void> getHistoricalData() async {
    emit(HistoricalLoading());
   var historicalResult = await _convertRepo.getHistorical();
   historicalModel = HistoricalModel.fromMap(historicalResult,"USDEGP");
    emit(ConvertDone());
  }
}
