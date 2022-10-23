// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@Entity()
class CryptoCoin extends Equatable {
  @Id()
  int? internalId;
  @Unique()
  final String? id;
  final String? name;
  final String? symbol;
  final double? currentPrice;
  bool starred;
  CryptoCoin({
    this.internalId,
    this.id,
    this.name,
    this.symbol,
    this.currentPrice,
    this.starred = false
  });

  @override
  List<Object?> get props => [
    internalId,
    id,
    name,
    symbol,
    currentPrice,
    starred];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'internalId': internalId,
      'id': id,
      'name': name,
      'symbol': symbol,
      'currentPrice': currentPrice,
      'starred': starred,
    };
  }

  factory CryptoCoin.fromMap(Map<String, dynamic> map) {
    return CryptoCoin(
      internalId: map['internalId'] != null ? map['internalId'] as int : null,
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      symbol: map['symbol'] != null ? map['symbol'] as String : null,
      currentPrice: map['currentPrice'] != null ? map['currentPrice'] as double : null,
      starred: map['starred'] != null ? map['starred'] as bool : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoCoin.fromJson(String source) => CryptoCoin.fromMap(json.decode(source) as Map<String, dynamic>);
}
