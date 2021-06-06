import 'package:flutter/material.dart';
import 'package:flutter_money_tool/common/dao/HomeDao.dart';
import 'package:flutter_money_tool/model/stock_list.dart';
import 'package:flutter_money_tool/ui/widget/my_search.dart' as mySearchView;

class StockSearchDelegate extends mySearchView.SearchDelegate<StockData> {
  late BuildContext _context;

  late List<StockData> _stockDataList;
  StockSearchDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Container(),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      alignment: Alignment.center,
      child: InkWell(
        onTap: (){
          close(context, null);
        },
        child: AnimatedIcon(
            size: 20,
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Color(0xff2E3032),
      child: Text(query,style: TextStyle(fontSize: 12, color: Color(0xffbbbbbb)),),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _context = context;
    return _buildSearchContentView();
  }

  _buildSearchContentView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildSearchItemView()],
      ),
    );
  }

  _buildSearchItemView() {
    return FutureBuilder(
        future: HomeDao.searchStocks(this.query, maxCount: 22),
        builder: (BuildContext context, AsyncSnapshot<List<StockData>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              //错误页
              return Container();
            } else {
              if (snapshot.hasData) {
                _stockDataList = snapshot.data!;
                return Container(
                  child: Wrap(
                    // runSpacing: 0,
                    children: _stockDataList
                        .map((item) {
                      return _buildSearchItem(item);
                    })
                        .toList()
                        .cast<Widget>(),
                  ),
                );
              } else {
                return Center(child: Text("加载失败，没有数据!!!!"));
              }
            }
          } else {
            // 请求未结束，显示loading
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
//                            child: SpinKitCubeGrid(color: Colors.greenAccent)),
//                            child: PivotTransitionPage()
                          child: Center(
                              child: CircularProgressIndicator(
                                  strokeWidth: 1.0,
                                  valueColor: AlwaysStoppedAnimation(Color(0xffdddddd)),
                                  backgroundColor: Colors.transparent)))
                    ]));
          }
        });
  }

  _buildSearchItem(StockData stockItem) {
    return InkWell(
      onTap: () {
        close(_context, stockItem);
      },
      child: Container(
        padding: EdgeInsets.all(4),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text(stockItem.name,style: TextStyle(fontSize: 10, color: Color(0xffbbbbbb)),),
            Text(stockItem.code,style: TextStyle(fontSize: 10, color: Color(0xffbbbbbb)),),
          ],),
          Container(
            margin: EdgeInsets.only(top: 4),
            width: double.infinity,
            height: 0.2,
            color: Color(0xffbbbbbb),
          )
        ],),
      ),
    );
  }
}
