// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealtimeData _$RealtimeDataFromJson(Map<String, dynamic> json) {
  return RealtimeData(
    json['symbol'] as String?,
    (json['current'] as num?)?.toDouble(),
    (json['percent'] as num?)?.toDouble(),
    (json['chg'] as num?)?.toDouble(),
    json['timestamp'] as int?,
    json['volume'] as int?,
    json['amount'] as double?,
    json['marketCapital'] as int?,
    json['floatMarketCapital'] as int?,
    (json['turnoverRate'] as num?)?.toDouble(),
    (json['amplitude'] as num?)?.toDouble(),
    (json['open'] as num?)?.toDouble(),
    (json['lastClose'] as num?)?.toDouble(),
    (json['high'] as num?)?.toDouble(),
    (json['low'] as num?)?.toDouble(),
    (json['avgPrice'] as num?)?.toDouble(),
    json['isTrade'] as bool?,
    json['level'] as int?,
    (json['currentYearPercent'] as num?)?.toDouble(),
    json['type'] as int?,
  );
}

Map<String, dynamic> _$RealtimeDataToJson(RealtimeData instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'current': instance.current,
      'percent': instance.percent,
      'chg': instance.chg,
      'timestamp': instance.timestamp,
      'volume': instance.volume,
      'amount': instance.amount,
      'marketCapital': instance.marketCapital,
      'floatMarketCapital': instance.floatMarketCapital,
      'turnoverRate': instance.turnoverRate,
      'amplitude': instance.amplitude,
      'open': instance.open,
      'lastClose': instance.lastClose,
      'high': instance.high,
      'low': instance.low,
      'avgPrice': instance.avgPrice,
      'isTrade': instance.isTrade,
      'level': instance.level,
      'currentYearPercent': instance.currentYearPercent,
      'type': instance.type,
    };
