import 'dart:convert';

import 'package:objectbox/objectbox.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@Entity()
class CryptoCoin {
  @Id()
  int? internalId;
  @Unique()
  final String? id;
  final String? name;
  final String? symbol;
  final double? currentPrice;
  final bool? starred;
  CryptoCoin({
    this.internalId,
    this.id,
    this.name,
    this.symbol,
    this.currentPrice,
    this.starred
  });

  

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "internal_id": internalId,
      'id': id,
      'name': name,
      'symbol': symbol,
      'current_price': currentPrice,
      'starred': starred,
    };
  }

  factory CryptoCoin.fromMap(Map<String, dynamic> map) {
    return CryptoCoin(
      internalId: map['internal_id'] != null ? map['internal_id'] as int : null,
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      symbol: map['symbol'] != null ? map['symbol'] as String : null,
      currentPrice: map['current_price'] != null ? map['current_price'] as double : null,
      starred: map['starred'] != null ? map['starred'] as bool : null,

    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoCoin.fromJson(String source) => CryptoCoin.fromMap(json.decode(source) as Map<String, dynamic>);
}
