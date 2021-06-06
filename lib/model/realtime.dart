import 'package:flutter_money_tool/model/realtime_data.dart';
import 'package:json_annotation/json_annotation.dart';

// 将在我们运行生成命令后自动生成
part 'realtime.g.dart';

//这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class RealtimeList {
  List<RealtimeData>? data;
  int? errorCode;
  String? errorDescription;

  RealtimeList(this.data, this.errorCode, this.errorDescription);

  factory RealtimeList.fromJson(Map<String, dynamic> json) =>
      _$RealtimeListFromJson(json);

  Map<String, dynamic> toJson() => _$RealtimeListToJson(this);
}
