import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_money_tool/common/constant.dart';
import 'package:flutter_money_tool/common/dao/HomeDao.dart';
import 'package:flutter_money_tool/model/realtime.dart';
import 'package:flutter_money_tool/model/stock_list.dart';
import 'package:flutter_money_tool/storage/pref.dart';
import 'package:flutter_money_tool/ui/page/stock_search.dart';
import 'package:flutter_money_tool/util/object_util.dart';
import 'package:flutter_money_tool/ui/widget/my_search.dart' as mySearchView;

import 'about.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Data> _realtimeList; //实时数据list

  List<StockData> _stockList = []; //所有代码和名称
  //是否暂停轮询请求
  bool _isStopRequest = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getStockList();
    _getRealtime();
  }

  void _getStockList() async {
    try {
      //先从缓存取，再刷新接口
      String cacheStockList =
          await Pref.getString(PrefKey.CACHE_KEY_STOCK_LIST, "");
      if (ObjectUtil.isNotEmpty(cacheStockList)) {
        var decodeData = json.decode(cacheStockList);
        _stockList = StockList.fromJson(decodeData).data;
      }
      var stockListData = await HomeDao.stockList();
      _stockList = stockListData.data;
      setState(() {});
    } catch (e) {
      Pref.setString(PrefKey.CACHE_KEY_STOCK_LIST, "");
      _getStockList();
      print(e);
    }
  }

  void _getRealtime() async {
    try {
      List<String> symbolList = []; //股票代码list
      String optionalListStr =
          await Pref.getString(PrefKey.CACHE_KEY_OPTIONAL_LIST, "");
      if (ObjectUtil.isNotEmpty(optionalListStr)) {
        //转成list,add进入
        var decode = json.decode(optionalListStr);
        for (int i = 0; i < decode.length; i++) {
          symbolList.add(decode[i]);
        }
        var realtimeData = await HomeDao.realtimeList(symbolList: symbolList);
        if (!_isStopRequest) {
          //延迟1s继续刷新实时接口
          _onRealtimeTimer();
          _realtimeList = realtimeData.data;
          setState(() {});
        }
      }
    } catch (e) {
      print("_getRealtime:e=$e");
    }
  }

  void _onRealtimeTimer() {
    Future.delayed(Duration(milliseconds: 1000), _getRealtime);
  }

  ///添加
  void _addStock() {
    List<String> optionalList = [];
    mySearchView
        .showSearch(
            context: context,
            delegate: StockSearchDelegate(hintText: "输入代码或名称"))
        .then((stockData) async {
      if (ObjectUtil.isNotEmpty(stockData)) {
        String optionalListStr =
            await Pref.getString(PrefKey.CACHE_KEY_OPTIONAL_LIST, "");
        if (ObjectUtil.isNotEmpty(optionalListStr)) {
          //转成list,add进入
          var decode = json.decode(optionalListStr);
          decode.add(stockData.code.toUpperCase());
          for (int i = 0; i < decode.length; i++) {
            optionalList.add(decode[i]);
          }
          // optionalList.addAll(decode);
        } else {
          //add list
          optionalList.add(stockData.code.toUpperCase());
        }

        //转json字符串,缓存
        String data = json.encode(optionalList);
        Pref.setString(PrefKey.CACHE_KEY_OPTIONAL_LIST, data);

        //刷新主页列表
        _onRealtimeTimer();
      }
    });
  }

  ///移除
  void _subtract() {
    //如果列表为空，则不执行移除逻辑
    if (_realtimeList == null || _realtimeList.length == 0) {
      return;
    }
    //点击减//显示删除按钮
    if (!_isStopRequest) {
      _isStopRequest = true;
    } else {
      //点击完成//隐藏删除按钮//轮询
      _isStopRequest = false;
      _onRealtimeTimer();
    }

    setState(() {});
  }

  void _deleteItem(int index) async {
    var symbolCode = _realtimeList[index].symbol;
    String optionalListStr =
        await Pref.getString(PrefKey.CACHE_KEY_OPTIONAL_LIST, "");
    if (ObjectUtil.isNotEmpty(optionalListStr) &&
        optionalListStr.contains(symbolCode.toUpperCase())) {
      //转成list,移除
      var decode = json.decode(optionalListStr);
      decode.remove(symbolCode.toUpperCase());
      //转json字符串,缓存
      String data = json.encode(decode);
      Pref.setString(PrefKey.CACHE_KEY_OPTIONAL_LIST, data);
      //刷新下列表
      _realtimeList.removeAt(index);
      //如果列表为空，则自动点击完成
      if (_realtimeList == null || _realtimeList.length == 0) {
        _isStopRequest = false;
      }
      setState(() {});
    }
  }

  ///跳转到关于页面
  void _about() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => AboutPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2E3032),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
            child: _realtimeList == null || _realtimeList.length == 0
                ? Container(
                    child: Image.asset(
                      "static/images/not_data.png",
                      width: 80,
                      height: 80,
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: ListView.builder(
                        itemCount: _realtimeList.length,
                        itemBuilder: (context, index) => _listItem(index)),
                  )),
        Container(
          padding: EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: _addStock,
                child: Image.asset(
                  "static/images/add.png",
                  width: 18,
                  height: 18,
                ),
              ),
              InkWell(
                onTap: _subtract,
                child: Image.asset(
                  _isStopRequest
                      ? "static/images/ok.png"
                      : "static/images/subtract.png",
                  width: 20,
                  height: 20,
                ),
              ),
              InkWell(
                onTap: _about,
                child: Image.asset(
                  "static/images/about.png",
                  width: 18,
                  height: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _listItem(int index) {
    var symbolCode = _realtimeList[index].symbol;
    for (var item in _stockList) {
      if (symbolCode.toLowerCase().contains(item.code.toLowerCase())) {
        symbolCode = item.name;
        print("symbolCode==" + symbolCode);
        break;
      }
    }
    return Container(
      margin: EdgeInsets.only(left: 5, top: 3, right: 5, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            child: Text(
              "$symbolCode",
              style: TextStyle(fontSize: 12, color: Color(0xffbbbbbb)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          _isStopRequest
              ? Container(
                  child: InkWell(
                    onTap: () {
                      _deleteItem(index);
                    },
                    child: Image.asset(
                      "static/images/delete.png",
                      width: 15,
                      height: 15,
                    ),
                  ),
                )
              : Text(
                  "${_realtimeList[index].percent}%",
                  style: TextStyle(fontSize: 12, color: Color(0xffbbbbbb)),
                )
        ],
      ),
    );
  }
}
