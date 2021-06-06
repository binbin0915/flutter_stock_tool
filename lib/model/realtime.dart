class RealtimeList {
  List<Data> _data;
  int _errorCode;
  Null _errorDescription;

  RealtimeList({List<Data> data, int errorCode, Null errorDescription}) {
    this._data = data;
    this._errorCode = errorCode;
    this._errorDescription = errorDescription;
  }

  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;
  Null get errorDescription => _errorDescription;
  set errorDescription(Null errorDescription) =>
      _errorDescription = errorDescription;

  RealtimeList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
    _errorCode = json['error_code'];
    _errorDescription = json['error_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    data['error_code'] = this._errorCode;
    data['error_description'] = this._errorDescription;
    return data;
  }
}

class Data {
  String _symbol;
  double _current;
  double _percent;
  double _chg;
  int _timestamp;
  int _volume;
  double _amount;
  double _marketCapital;
  double _floatMarketCapital;
  double _turnoverRate;
  double _amplitude;
  double _open;
  double _lastClose;
  double _high;
  double _low;
  double _avgPrice;
  int _tradeVolume;
  int _side;
  bool _isTrade;
  int _level;
  String _tradeSession;
  String _tradeType;
  double _currentYearPercent;
  String _tradeUniqueId;
  int _type;
  String _bidApplSeqNum;
  String _offerApplSeqNum;
  String _volumeExt;
  String _tradedAmountExt;

  Data(
      {String symbol,
        double current,
        double percent,
        double chg,
        int timestamp,
        int volume,
        double amount,
        double marketCapital,
        double floatMarketCapital,
        double turnoverRate,
        double amplitude,
        double open,
        double lastClose,
        double high,
        double low,
        double avgPrice,
        int tradeVolume,
        int side,
        bool isTrade,
        int level,
        String tradeSession,
        String tradeType,
        double currentYearPercent,
        String tradeUniqueId,
        int type,
        String bidApplSeqNum,
        String offerApplSeqNum,
        String volumeExt,
        String tradedAmountExt}) {
    this._symbol = symbol;
    this._current = current;
    this._percent = percent;
    this._chg = chg;
    this._timestamp = timestamp;
    this._volume = volume;
    this._amount = amount;
    this._marketCapital = marketCapital;
    this._floatMarketCapital = floatMarketCapital;
    this._turnoverRate = turnoverRate;
    this._amplitude = amplitude;
    this._open = open;
    this._lastClose = lastClose;
    this._high = high;
    this._low = low;
    this._avgPrice = avgPrice;
    this._tradeVolume = tradeVolume;
    this._side = side;
    this._isTrade = isTrade;
    this._level = level;
    this._tradeSession = tradeSession;
    this._tradeType = tradeType;
    this._currentYearPercent = currentYearPercent;
    this._tradeUniqueId = tradeUniqueId;
    this._type = type;
    this._bidApplSeqNum = bidApplSeqNum;
    this._offerApplSeqNum = offerApplSeqNum;
    this._volumeExt = volumeExt;
    this._tradedAmountExt = tradedAmountExt;
  }

  String get symbol => _symbol;
  set symbol(String symbol) => _symbol = symbol;
  double get current => _current;
  set current(double current) => _current = current;
  double get percent => _percent;
  set percent(double percent) => _percent = percent;
  double get chg => _chg;
  set chg(double chg) => _chg = chg;
  int get timestamp => _timestamp;
  set timestamp(int timestamp) => _timestamp = timestamp;
  int get volume => _volume;
  set volume(int volume) => _volume = volume;
  double get amount => _amount;
  set amount(double amount) => _amount = amount;
  double get marketCapital => _marketCapital;
  set marketCapital(double marketCapital) => _marketCapital = marketCapital;
  double get floatMarketCapital => _floatMarketCapital;
  set floatMarketCapital(double floatMarketCapital) =>
      _floatMarketCapital = floatMarketCapital;
  double get turnoverRate => _turnoverRate;
  set turnoverRate(double turnoverRate) => _turnoverRate = turnoverRate;
  double get amplitude => _amplitude;
  set amplitude(double amplitude) => _amplitude = amplitude;
  double get open => _open;
  set open(double open) => _open = open;
  double get lastClose => _lastClose;
  set lastClose(double lastClose) => _lastClose = lastClose;
  double get high => _high;
  set high(double high) => _high = high;
  double get low => _low;
  set low(double low) => _low = low;
  double get avgPrice => _avgPrice;
  set avgPrice(double avgPrice) => _avgPrice = avgPrice;
  int get tradeVolume => _tradeVolume;
  set tradeVolume(int tradeVolume) => _tradeVolume = tradeVolume;
  int get side => _side;
  set side(int side) => _side = side;
  bool get isTrade => _isTrade;
  set isTrade(bool isTrade) => _isTrade = isTrade;
  int get level => _level;
  set level(int level) => _level = level;
  String get tradeSession => _tradeSession;
  set tradeSession(String tradeSession) => _tradeSession = tradeSession;
  String get tradeType => _tradeType;
  set tradeType(String tradeType) => _tradeType = tradeType;
  double get currentYearPercent => _currentYearPercent;
  set currentYearPercent(double currentYearPercent) =>
      _currentYearPercent = currentYearPercent;
  String get tradeUniqueId => _tradeUniqueId;
  set tradeUniqueId(String tradeUniqueId) => _tradeUniqueId = tradeUniqueId;
  int get type => _type;
  set type(int type) => _type = type;
  String get bidApplSeqNum => _bidApplSeqNum;
  set bidApplSeqNum(String bidApplSeqNum) => _bidApplSeqNum = bidApplSeqNum;
  String get offerApplSeqNum => _offerApplSeqNum;
  set offerApplSeqNum(String offerApplSeqNum) =>
      _offerApplSeqNum = offerApplSeqNum;
  String get volumeExt => _volumeExt;
  set volumeExt(String volumeExt) => _volumeExt = volumeExt;
  String get tradedAmountExt => _tradedAmountExt;
  set tradedAmountExt(String tradedAmountExt) =>
      _tradedAmountExt = tradedAmountExt;

  Data.fromJson(Map<String, dynamic> json) {
    _symbol = json['symbol'];
    _current = json['current'];
    _percent = json['percent'];
    _chg = json['chg'];
    _timestamp = json['timestamp'];
    _volume = json['volume'];
    _amount = json['amount'];
    _marketCapital = json['market_capital'];
    _floatMarketCapital = json['float_market_capital'];
    _turnoverRate = json['turnover_rate'];
    _amplitude = json['amplitude'];
    _open = json['open'];
    _lastClose = json['last_close'];
    _high = json['high'];
    _low = json['low'];
    _avgPrice = json['avg_price'];
    _tradeVolume = json['trade_volume'];
    _side = json['side'];
    _isTrade = json['is_trade'];
    _level = json['level'];
    _tradeSession = json['trade_session'];
    _tradeType = json['trade_type'];
    _currentYearPercent = json['current_year_percent'];
    _tradeUniqueId = json['trade_unique_id'];
    _type = json['type'];
    _bidApplSeqNum = json['bid_appl_seq_num'];
    _offerApplSeqNum = json['offer_appl_seq_num'];
    _volumeExt = json['volume_ext'];
    _tradedAmountExt = json['traded_amount_ext'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this._symbol;
    data['current'] = this._current;
    data['percent'] = this._percent;
    data['chg'] = this._chg;
    data['timestamp'] = this._timestamp;
    data['volume'] = this._volume;
    data['amount'] = this._amount;
    data['market_capital'] = this._marketCapital;
    data['float_market_capital'] = this._floatMarketCapital;
    data['turnover_rate'] = this._turnoverRate;
    data['amplitude'] = this._amplitude;
    data['open'] = this._open;
    data['last_close'] = this._lastClose;
    data['high'] = this._high;
    data['low'] = this._low;
    data['avg_price'] = this._avgPrice;
    data['trade_volume'] = this._tradeVolume;
    data['side'] = this._side;
    data['is_trade'] = this._isTrade;
    data['level'] = this._level;
    data['trade_session'] = this._tradeSession;
    data['trade_type'] = this._tradeType;
    data['current_year_percent'] = this._currentYearPercent;
    data['trade_unique_id'] = this._tradeUniqueId;
    data['type'] = this._type;
    data['bid_appl_seq_num'] = this._bidApplSeqNum;
    data['offer_appl_seq_num'] = this._offerApplSeqNum;
    data['volume_ext'] = this._volumeExt;
    data['traded_amount_ext'] = this._tradedAmountExt;
    return data;
  }
}
