class StockList {
  int _code;
  String _msg;
  int _time;
  List<StockData> _data;

  StockList({int code, String msg, int time, List<StockData> data}) {
    this._code = code;
    this._msg = msg;
    this._time = time;
    this._data = data;
  }

  int get code => _code;
  set code(int code) => _code = code;
  String get msg => _msg;
  set msg(String msg) => _msg = msg;
  int get time => _time;
  set time(int time) => _time = time;
  List<StockData> get data => _data;
  set data(List<StockData> data) => _data = data;

  StockList.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _msg = json['msg'];
    _time = json['time'];
    if (json['data'] != null) {
      _data = new List<StockData>();
      json['data'].forEach((v) {
        _data.add(new StockData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['msg'] = this._msg;
    data['time'] = this._time;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StockData {
  String _id;
  String _code;
  String _name;

  StockData({String id, String code, String name}) {
    this._id = id;
    this._code = code;
    this._name = name;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get code => _code;
  set code(String code) => _code = code;
  String get name => _name;
  set name(String name) => _name = name;

  StockData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _code = json['code'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['code'] = this._code;
    data['name'] = this._name;
    return data;
  }
}
