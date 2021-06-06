
///地址数据
class Address {

  ///实时数据
  static realtimeList({required List<String> symbolList}){
    String symbolStr = "";
    for(int i=0;i<symbolList.length;i++){
      if(i==symbolList.length-1){
        symbolStr = symbolStr + symbolList[i];
      }else{
        symbolStr = symbolStr + symbolList[i]+",";
      }
    }
    return "https://stock.xueqiu.com/v5/stock/realtime/quotec.json?symbol=$symbolStr";
  }

  ///所有列表
  static stockList(){
    return "https://www.joy666.cn/wxapi/stock/list";
  }

}
