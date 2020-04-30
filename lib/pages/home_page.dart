import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imgList = [
    'http://fpoimg.com/375x160',
    'http://fpoimg.com/375x160',
    'http://fpoimg.com/375x160'
  ];
  static const int APPBAR_SCROLL_OFFSET = 100;
  double appBarAlpha = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification &&
                    notification.depth == 0) {
                  _scroll(notification.metrics.pixels);
                }

                return true;
              },
              child: ListView(
                children: <Widget>[
                  Container(
                      height: 160,
                      color: Colors.red,
                      child: Swiper(
                        itemCount: _imgList.length,
                        autoplay: true,
                        itemBuilder: (context, index) {
                          return Image.network(
                            _imgList[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      )),
                  Container(
                    child: ListTile(title: Text('padding')),
                    height: 900,
                  )
                ],
              )),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              // color: Colors.red,
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(child: Padding(padding: EdgeInsets.only(top: 20), child: Text('首页'),),),
            ),
          )
        ],
      ),
    );
  }

  void _scroll(double offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if(alpha < 0) {
      alpha = 0;
    } else if(alpha > 1){
      alpha = 1;
    }
    setState(() {
      appBarAlpha= alpha;
    });
  }
}

// Swiper(itemCount: _imgList.length,
//           autoplay: true,
//           itemBuilder: (context, index) {
//                   return Text('index:${index}');r
//                 }),
//         )q
