import 'package:bancolombia_test/features/list_crypto/domain/entities/crypto_coin.dart';
import 'package:dio/dio.dart';

import '../../../../core/provider/http_result.dart';

class CoinGeckoApi {
  var dioClient;
  CoinGeckoApi() {
    dioClient = Dio();
  }

  Future<HttpResult> getCoinsDetailed(
      {String vsCurrency = "usd",
      String order = "market_cap_desc",
      String perPage = "15",
      int page = 1}) async {
        
    final result = await dioClient.get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=$vsCurrency&order=$order&per_page=$perPage&page=${page.toString()}&sparkline=false',
        options: Options(headers: {"Accept": "application/json"}));

    if (result.statusCode! >= 400) {
      throw HttpError(
          exception: null, stackTrace: StackTrace.current, data: result.data);
    }
    return HttpResult(
        data: result.data, statusCode: result.statusCode, error: null);
  }
}
