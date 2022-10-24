import 'package:bancolombia_test/core/provider/http_result.dart';
import 'package:bancolombia_test/features/list_crypto/data/datasources/coingecko_api.dart';
import 'package:bancolombia_test/features/list_crypto/data/datasources/coingecko_manager.dart';
import 'package:bancolombia_test/features/list_crypto/domain/entities/crypto_coin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'coingecko_manager_test.mocks.dart';

@GenerateMocks([
  CoinGeckoApi
], customMocks: [
  MockSpec<CoinGeckoApi>(as: #MockCryptoDatasource),
])
Future<void> main() async {
  CoinGeckoManager? manager;
  MockCoinGeckoApi? memberApi;

   setUp(() {
    memberApi = MockCoinGeckoApi();
    manager = CoinGeckoManager(memberApi!);
  });

  group('getCoinsDetailed', () {
    final dummy = CryptoCoin(name: "BitCoin");
    List<dynamic> data = [dummy.toMap()];

    void setUpMockHttpSuccess200() {
      when(memberApi!.getCoinsDetailed()).thenAnswer((_) async =>
          HttpResult(data: data, statusCode: 200, error: null));
    }

    void setUpMockHttpFailure400() {
      when(memberApi!.getCoinsDetailed()).thenAnswer((_) async => HttpResult(
          error: HttpError(exception: Exception(), stackTrace: StackTrace.current, data: data),
          statusCode: 404,
          data: null));
    }

    test(
      'should return cryptocoins when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpSuccess200();
        // act
        final result = await manager!.getCoinsDetailed();
        // assert
        expect(result, equals([dummy]));
      },
    );
    
    test(
      'should throw errow an exception when the response code is 400 or other',
      () async {
        // arrange
        setUpMockHttpFailure400();
        // act
        final call = manager!.getCoinsDetailed();
        // assert
        expect(() => call, throwsA(const TypeMatcher<Exception>()));
      },
    );
  });
}
