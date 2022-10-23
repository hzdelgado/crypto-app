import 'dart:io';

import 'package:bancolombia_test/features/list_crypto/domain/entities/crypto_coin.dart';
import 'package:path_provider/path_provider.dart';

import '../../objectbox.g.dart';

class ObjectBox {
  late final Store store;
  Box<CryptoCoin>? _cryptoCoinBox;

  Box<CryptoCoin> get cryptoCoinBox => _cryptoCoinBox!;

  ObjectBox(Store store) {
    _cryptoCoinBox = store.box<CryptoCoin>();
  }

  static Future<ObjectBox> create() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    final store = await openStore(
        directory: appDocDirectory.path);
    return ObjectBox._create(store);
  }

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  Future<void> deleteDbFiles() async {
    _cryptoCoinBox?.removeAll();

  }
}
