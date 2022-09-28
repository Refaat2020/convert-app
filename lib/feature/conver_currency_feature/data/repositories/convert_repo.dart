import 'package:currencyconverter/core/services/restful_api_client.dart';
import 'package:currencyconverter/feature/conver_currency_feature/domain/usecases/convert_usecase.dart';
import 'package:currencyconverter/locator.dart';
import 'package:date_format/date_format.dart';

import '../../../../core/constant/app_constant.dart';

class ConvertRepo implements IConvert{

  final RestfulApiClient _client = locator<RestfulApiClient>();

  @override
  Future getList()async{
    final  result = await _client.getRequest(AppConstant.getAllListUrl);
    return result;
  }

  @override
  Future getConvert(String from ,String to ,String amount)async{
    final  result = await _client.getRequest(AppConstant.getConvertUrl,parms: {
      "from":from,
      "to":to,
      "amount":amount
    });
    return result;
  }

  @override
  Future getHistorical()async{
    final  result = await _client.getRequest(AppConstant.getHistoricalUrl,parms: {
      "date":formatDate(DateTime.now().subtract(const Duration(days: 7)), [yyyy, '-', mm, '-', dd,]),
      "currencies":"USD,EGP",
    });
    return result;
  }
}