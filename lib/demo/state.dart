import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('父子通信'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
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
    return Column(
      children: [
        Center(
          child: Text('Counter: $_counter'),
        ),
        ChildWidget(),
      ],
    );
  }
}

class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 通过BuildContext查找父级State对象
    _MyWidgetState? parentState =
        context.findAncestorStateOfType<_MyWidgetState>();
    return ElevatedButton(
      onPressed: () {
        parentState?.incrementCounter();
      },
      child: Text('父节点数据：${parentState?._counter ?? 0}'),
    );
  }
}
