import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AboutPageState();
  }

}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff2E3032),
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Color(0xff2E3032),
        leadingWidth: 20,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 5),
            child: Icon(Icons.arrow_back,color: Color(0xffbbbbbb),size: 20,),
          ),
        ),
        title: Text(
          "关于",
          style: TextStyle(fontSize: 12, color: Color(0xffbbbbbb)),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.all(5),
      child: ListView(children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top:5,bottom: 5),
          child: Text(
            "关注公众号，了解更多",
            style: TextStyle(fontSize: 12, color: Color(0xffbbbbbb),),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            "static/images/qrcode.jpg",
            width: 100,
            height: 100,
          ),
        )
      ],),
    );
  }
}