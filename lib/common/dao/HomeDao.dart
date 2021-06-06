import 'dart:async';
import 'dart:convert';

import 'package:flutter_money_tool/common/net/address.dart';
import 'package:flutter_money_tool/common/net/api.dart';
import 'package:flutter_money_tool/model/realtime.dart';
import 'package:flutter_money_tool/model/stock_list.dart';
import 'package:flutter_money_tool/storage/pref.dart';
import 'package:flutter_money_tool/util/object_util.dart';

import '../constant.dart';

class HomeDao {
  static Future<RealtimeList> realtimeList({List<String> symbolList}) async {
    try{
      String realtimeListUrl = Address.realtimeList(symbolList: symbolList);
      var res = await httpManager.netFetch(realtimeListUrl, null, null, null);
      if (res != null && res.result) {
        return RealtimeList.fromJson(res.data);
      }
    }catch(e){}
    return null;
  }

  static Future<StockList> stockList() async {
    try{
      var res = await httpManager.netFetch(Address.stockList(), null, null, null);
      if (res != null && res.result) {
        //缓存json字符串
        String data = json.encode(res.data);
        Pref.setString(PrefKey.CACHE_KEY_STOCK_LIST, data);
        return StockList.fromJson(res.data);
      }
    }catch(e){}
    return null;
  }

  static Future<List<StockData>> searchStocks(String text, {int maxCount}) async{
    //先从缓存取，再刷新接口
    List<StockData> _stockAllList;
    String cacheStockList =
        await Pref.getString(PrefKey.CACHE_KEY_STOCK_LIST, "");
    if (ObjectUtil.isNotEmpty(cacheStockList)) {
      var decodeData = json.decode(cacheStockList);
      _stockAllList = StockList.fromJson(decodeData).data;
    }

    List<StockData> list = [];
    if (text != null && _stockAllList!=null) {
      text = text.trim();
      if (text.isNotEmpty) {
        for (var item in _stockAllList) {
          if (item.name.contains(text) || item.code.contains(text)) {
            list.add(item);
          }
          if (list.length >= maxCount) {
            break;
          }
        }
      }
    }
    return list;
  }

}