import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
  static GlobalKey<_MyWidgetState> _globalKey = GlobalKey<_MyWidgetState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GlobalKey demo'),
        ),
        body: Column(
          children: [
            MyWidget(key: _globalKey),  //设置key
            ElevatedButton(
              onPressed: () {
                // 通过GlobalKey访问State对象的方法
                _globalKey.currentState?.incrementCounter();
              },
              child: Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Counter: $_counter'),
    );
  }
}
