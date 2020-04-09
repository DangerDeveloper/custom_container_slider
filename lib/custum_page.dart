import './custum_box.dart';
import './data.dart';
import 'package:flutter/material.dart';


class CustumPage extends StatefulWidget {
  @override
  _CustumPageState createState() => _CustumPageState();
}

class _CustumPageState extends State<CustumPage> {
  var currentPage = data.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: data.length - 1);
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('FLUTTER UI',style: TextStyle(
          color: Colors.grey,
          fontSize: 20.0,
        ),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                CustumBox(currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: data.length,
                    reverse: true,
                    controller: pageController,
                    itemBuilder: (ctx, int) => Container(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
