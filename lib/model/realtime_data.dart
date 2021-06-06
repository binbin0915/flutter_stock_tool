import 'package:json_annotation/json_annotation.dart';

// 将在我们运行生成命令后自动生成
part 'realtime_data.g.dart';

//这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class RealtimeData{
  String? symbol;
  double? current;
  double? percent;
  double? chg;
  int? timestamp;
  int? volume;
  double? amount;
  int? marketCapital;
  int? floatMarketCapital;
  double? turnoverRate;
  double? amplitude;
  double? open;
  double? lastClose;
  double? high;
  double? low;
  double? avgPrice;
  bool? isTrade;
  int? level;
  double? currentYearPercent;
  int? type;


  RealtimeData(
      this.symbol,
      this.current,
      this.percent,
      this.chg,
      this.timestamp,
      this.volume,
      this.amount,
      this.marketCapital,
      this.floatMarketCapital,
      this.turnoverRate,
      this.amplitude,
      this.open,
      this.lastClose,
      this.high,
      this.low,
      this.avgPrice,
      this.isTrade,
      this.level,
      this.currentYearPercent,
      this.type);

  factory RealtimeData.fromJson(Map<String, dynamic> json) => _$RealtimeDataFromJson(json);

  Map<String, dynamic> toJson() => _$RealtimeDataToJson(this);
}