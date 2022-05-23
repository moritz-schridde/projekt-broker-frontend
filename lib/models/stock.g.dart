// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      shortName: json['shortName'] as String,
      longName: json['longName'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'shortName': instance.shortName,
      'longName': instance.longName,
      'price': instance.price,
    };
