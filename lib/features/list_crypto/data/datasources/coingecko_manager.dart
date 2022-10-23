import 'package:bancolombia_test/features/list_crypto/data/datasources/coingecko_api.dart';
import 'package:bancolombia_test/features/list_crypto/domain/entities/crypto_coin.dart';

class CoinGeckoManager {
  final CoinGeckoApi _api;

  CoinGeckoManager(this._api);

  Future<List<CryptoCoin>?> getCoinsDetailed(
      {String order = "market_cap_desc",
      String perPage = "15",
      int page = 1}) async {
    final result = await _api.getCoinsDetailed(order: order, perPage: perPage, page: page);
    if (result.error == null) {
      List<CryptoCoin> response = List<CryptoCoin>.from(
        (result.data as List<dynamic>).map<CryptoCoin>(
          (x) => CryptoCoin.fromMap(x as Map<String, dynamic>),
        ),
      );
      return response;
    }
    return null;
  }
}
