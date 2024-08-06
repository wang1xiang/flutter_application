import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('My First App'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: const MyApp(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          onTap: (value) {
            print(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ]),
      drawer: const Drawer(
        child: Text('左侧Drawer'),
      ),
      endDrawer: const Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: DrawerHeader(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://q2.itc.cn/q_70/images03/20240320/3df8c75302424a05864e62215a548e28.jpeg'),
                                fit: BoxFit.cover)),
                        child: Text('头部')))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Click'),
        backgroundColor: Colors.red[600],
      ),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _numberCount = 0;
  @override
  Widget build(BuildContext context) {
    print(_numberCount);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$_numberCount',
              style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _numberCount++;
                });
              },
              child: const Text('Increment'))
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name = "张三";
  final String phone = "13800138000";

  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://q2.itc.cn/q_70/images03/20240320/3df8c75302424a05864e62215a548e28.jpeg"),
              radius: 40,
            ),
            const SizedBox(height: 16),
            Text(name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(phone, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  Color color;
  IconData icon;
  IconContainer(this.icon, {super.key, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      color: color,
      child: Icon(
        icon,
        size: 28,
        color: Colors.white,
      ),
    );
  }
}
