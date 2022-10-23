import 'package:bancolombia_test/features/list_crypto/domain/entities/crypto_coin.dart';
import 'package:bancolombia_test/features/list_crypto/presentation/widgets/list_view/star_button.dart';
import 'package:flutter/material.dart';

class CryptoListViewItem extends StatelessWidget {
  final CryptoCoin coin;
  final bool showStarred;
  const CryptoListViewItem({Key? key, required this.coin, this.showStarred = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Flexible(child: Text("${coin.name} (${coin.symbol!.toUpperCase()}) - ${coin.currentPrice} USD")),
        showStarred? StarButton(coin: coin): const SizedBox()
      ])
    );
  }
}