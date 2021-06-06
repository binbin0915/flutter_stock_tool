
class NetResEntity<T> {
  T _data;
  var _errorData;

  bool _success;
  int _statusCode;

  NetResEntity(this._success, this._statusCode, {data, errorData})
      : assert(_success != null),
//        assert(statusCode != null),
        assert(data != null || errorData != null) {
    this._data = data;
    this.errorData = errorData;
  }

  int get statusCode => _statusCode;

  set statusCode(int value) {
    _statusCode = value;
  }

  T get data => _data;

  set data(T value) {
    _data = value;
  }

  bool get success => _success;

  set success(bool value) {
    _success = value;
  }

  get errorData => _errorData;

  set errorData(value) {
    _errorData = value;
  }
}
