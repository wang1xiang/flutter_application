// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基本信息'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBasicInfo('手机号', '13437899999'),
            buildBasicInfo('注册时间', '2024-06-10'),
            SizedBox(height: 20),
            buildInfoCard(
              title: '社交影响力',
              icon: Icons.verified,
              value: '15',
              color: Colors.blue,
            ),
            buildInfoCard(
              title: '阳光信用',
              icon: Icons.wb_sunny,
              value: '200',
              color: Colors.orange,
            ),
            buildInfoCard(
              title: '粉丝数',
              icon: Icons.favorite,
              value: '15',
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBasicInfo(String title, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 16)),
            Text(value, style: TextStyle(fontSize: 16)),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget buildInfoCard({required String title, required IconData icon, required String value, required Color color}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 40),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 16, color: color)),
              Text(value, style: TextStyle(fontSize: 24, color: color)),
            ],
          ),
        ],
      ),
    );
  }
}