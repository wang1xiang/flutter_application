# Dart

## 定义变量

- var
- const
- final

  - const 能实现的 final 都能实现
  - 运行时常量，final 是惰性初始化
  - 先声明后使用

    ```dart
    final a;
    a = 12;
    print(a)
    ```

  - 即在运行时第一次使用前才初始化 `final a = new DateTime.now();`

## 数据类型

- String
  - `String str = 'hello';`
- int/double
  - 必须是整型 `int a = 1`
  - 可以是整型或浮点型 `double b = 1.0`
- bool 布尔
  - true/false
- list 数组/集合
  - `vat list = ['1', 2, false];`
  - 指定类型`vat list =<int>[1, 2];`
  - 增加数据 `list.add(3);`
  - 创建固定长度集合 `var list = List.filled(2, "")` 无法使用 add 增加数据
- Maps 字典
  - key 值必须加引号
  - 获取值使用 `map['key']`

`var` 定义的变量自动推断类型

### 类型判断

- `is`
  - `if (a is String) {`

### 可空类型

`?` 表示可空类型，可以将 null 赋值给变量

```dart
String? name = 'zs';
name = null;
```

## Dart 运算符

### 算数运算符

- `+-&*/`
- `%`取余
- `~/`取整

### 关系运算符

- `==`
- `!=`
- `><>=<=`

### 逻辑运算符

- `!` 取反
- `||` 或
- `&&` 并
- `??` 赋值

### 类型转换

- int -> String `int1.toString()`
- String -> int `int.parse(str)`
- String -> double `double1.parse(str)`

## List 集合操作

### 常见属性

- `list.length`
- `list.isEmpty`
- `list.isNotEmpty`
- `list.reversed`

### 常见方法

- `list.add(element)`
- `list.indexOf(element)`
- `list.remove(element)`
- `list.removeAt(index)`
- `list.insert(index, element)`
- `list.insertAll(index, [element, element])`
- 修改 `list.fillRange(start, end, fill)`
- List -> String `list.join(separator)`
- String -> List `str.split(separator)`
- `list.clear()`

- `list.sort()`
- `list.forEach(callback)`
- `list.map(callback)`
- `list.where(callback)`
- `list.any(callback)`
- `list.every(callback)`
- `list.reduce(callback)`

### Set

去重集合

## Map 操作

### 属性

- `map.length`
- `map.isEmpty`
- `map.isNotEmpty`

### 方法

- `map.keys`
- `map.values`
- `map.forEach(callback)`
- `map.containsKey(key)`
- `map.containsValue(value)`
- `map.remove(key)`
- `map.clear()`
- `map.addAll(other)`

## 函数

- 指定返回类型

```js
String xxx(String a, String b) {
  return 'xxx';
}
```

## 类 对象

### 类的定义

```dart
class Person() {
  String name = 'zs';
  int age = 18;

  void getInfo() {
    print('name: ${this.name}, age: ${this.age}');
  }
}
```

### 构建函数

#### 默认构造函数

```dart
class Person {
  String name;
  int age;

  // 默认构造函数
  // Person(String name, int age) {
  //  this.name = name;
  //  this.age = age;
  // }

  // 上面的构造函数可以简写为
  Person(this.name, this.age)
  void getInfo() {
    print('name: ${this.name}, age: ${this.age}');
  }
}

// 实例
Person p1 = Person('zs', 18);
```

#### 命名构造函数

dart 中构造函数可以写多个，默认构造函数 + 多个命名构造函数

```dart
class Person {
  String name;
  int age;

  // 默认构造函数
  Person(this.name, this.age)
  // 命名构造函数
  Person.setInfo(this.name, this.age)
  void getInfo() {
    print('name: ${this.name}, age: ${this.age}');
  }
}

// 实例
Person p1 = Person.setInfo('zs', 18);
```

#### 常量构造函数

- 常量构造函数必须使用 const 关键字
- 成员变量都需要使用 final
- 实例化常量构造函数，多个地方创建这个对象传入值相同时，只会保留一个对象
- Flutter 中 const 修饰节省组件构建时的内存开销，

```dart
class Container {
  final int width;
  final int height;

  const Container({required this.width, required this.height});
}
```

#### 私有属性/方法

私有属性/方法需要在属性前加 `_`，并且需要在模块内访问（单独抽离一个文件）

```dart
class Person {
  String _name;
  int age;

  // 默认构造函数
  Person(this._name, this.age)
  void getInfo() {
    print('name: ${this._name}, age: ${this.age}');
  }
  String getName() {
    return this._name;
  }
  void _run() {
    print('run');
  }
  execRun() {
    this._run();
  }
}

// 实例
Person p1 = Person.setInfo('zs', 18);
p1._name; // 报错
p1.getName();

p1._run(); // 报错
p1.execRun();
```

#### getter 和 setter

getter 和 setter 是 Dart 中的一种特殊语法，用于获取和设置对象的属性值。它们允许我们定义对象的属性，并控制其如何被读取和修改。

```dart
class Person {
  String name;
  int age;

  // 默认构造函数
  Person(this._name, this.age)

  get info {
    return this.name + this.age
  }
  set info(value) {
    this.name = value.name;
    this.age = value.age;
  }
}

// 实例
Person p1 = Person.setInfo('zs', 18);
print(p1.info);

p1.info({
  "name": "ls",
  "age": 20
});
```

计算属性

#### 静态属性/方法

- static 关键字声明静态属性/方法
- 静态方法不能访问非静态属性，非静态方法可以访问静态属性
- 静态属性/方法使用时不用加 `this`

```dart
class Person {
  static String name = 'zs';
  int age = 20;

  static void getName () {
    print('name: ${name}')
  }
  void getInfo () {
    print('name: ${name}, age: ${this.age}')
  }
}

print(Person.name) // zs
Person.getName() // name: zs
```

### 继承

extends

- 子类继承父类可见的属性和方法
- 构造函数不继承

```dart
class Person {
  String name;
  num age;

  Person(this.name, this.age);
  void getInfo() {
    print('name: ${this.name}, age: ${this.age}');
  }
}

class Man extends Person {
  String sex;
  //  : super(name, age) 初始化列表 执行子类构造函数前，把子类传的值赋给父类构造函数
  Man(String name, num age, String sex) : super(name, age) {
    this.sex = sex
  }

  void run () {
    print('run')
  }
  // 重写父类的方法
  @override
  void getInfo() {
    print('name: ${this.name}, age: ${this.age}');
  }
}

main() {
  Man man = new Man('zs', 18, 'man');

  man.getInfo();
  man.run();
}

```

### 抽象类

- 通过 abstract 关键字定义抽象类
- 抽象类不能被实例化，只能被继承
- 抽象类中定义抽象方法，子类必须实现抽象方法，用来约束
- dart 中不需要使用 abstract 定义抽象方法，没有方法体的方法就是抽象方法

```dart
abstract class Animal {
  eat(); // 抽象方法
}
class Dog extends Animal {
  @override
  eat() {
    print('🐶吃骨头');
  }
}
class Cat extends Animal {
  @override
  eat() {
    print('🐱吃鱼');
  }
}
```

### 多态

- 父类定义一个方法不去实现，子类继承父类，每个子类有不同的表现，这样实现了多态

### 接口

- 接口就是抽象类中不包含公共方法，只有抽象方法
- 接口就是约定，定义标准和约束
- 抽象类中定义方法不实现，子类继承抽象类，实现属性，这样实现了接口

```dart
abstract class DB {
  add(String data);
  save();
  delete();
}

class Mysql implements DB {
  @override
  add(String data) {}
  @override
  save() {}
  @override
  delete() {}
}
```

#### 一个类实现多个接口

- dart 不能多继承，可以实现多个接口
- 通过 mixins 实现多继承（mixins 不是继承也不是接口，而是一种全新的特性）
- mixins 使用 with 关键字实现
- mixins 继承的类不能有构造函数
- 作为 mixins 的类不能有只能继承自 Object，不能继承自其他类

```dart
abstract class A {
  printA();
}
abstract class B {
  printB();
}

class C implements A, B {
  @override
  printA() {
    return 'A';
  }
  @override
  printB() {
    return 'B';
  }
}

// class C extends A, B {} 报错
class C with A, B {

}

class D extends B {}
// 报错
class E with A, D {}
```

## 泛型

- 解决类、接口、方法的复用性
- 对不特定数据类型的校验

### 泛型方法

```dart
// 传入和返回都校验
T getData<T>(T value) {
  return value;
}
// 只校验传入
getData1<T>(T value) {
  return value;
}

void main() {
  print(getData<String>('hello'))
  print(getData<int>(12))
}
```

### 泛型类

```dart
class MyList<T> {
  List list = <T>[];
  void add (T value) {
    this.list.add(value)
  }
}

void main() {
  MyList l = new MyList<String>();
  l.add("")
}
```

### 泛型接口

## Dart 库

### 自定义库

公共功能单独抽离成文件，这个文件叫做库，在使用的地方直接 `import xxx.dart` 引入即可。

### 系统内置库

安装完 dart 后，可以直接使用系统内置库。

```dart
import 'dart:io';
import 'dart:math';

main() {
  print(min(1, 2))
}
```

### Pub 仓库中的库

1. 需要在自己想项目根目录新建一个 pubspec.yam1
2. 在 pubspec.yaml 文件 然后配置名称、描述、依赖等信息
3. 然后运行 pub get 获取包

[http 包](https://pub.dev/packages/http)、[date_format 包](https://pub.dev/packages/date_format)

### 库的重命名

使用 as 关键字重命名

```dart
import 'Person1.dart';
import 'Person2.dart' as lib;

lib.Person p2 = new lin.Person('z', 12);
```

### 部分引入

```dart
import 'lib/myMath.dart' show getName;
void main()｛
  getName();
  // getSex(); 报错
  // getAge(); 报错
}
```

```dart
import 'lib/myMath.dart' hide getName;
void main()｛
  // getName(); 报错
  getSex(); 报错
  getAge(); 报错
}
```

# flutter

项目运行 flutter run

## 基础组件

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const Center(
    child: Text('nihao', textDirection: TextDirection.ltr, style: TextStyle(
      color: Colors.red,
      fontSize: 40
    ))
  ));
}
```

### 用 MaterialApp 和 Scaffold 两个组件装饰 App

1. MaterialApp

   MaterialApp 是一个方便的 Widget，它封装了应用程序实现 Material Design 所需要的一些 Widget。
   般作为顶层 widget 使用。
   常用的属性：

   - home（主页）
   - title（标题）
   - color（颜色）
   - theme（主题）
   - routes（路由）

2. Scaffold

   Scaffold 是 Material Design 布局结构的基本实现。此类提供了用于显示 drawer、snackbar 和底部 sheet
   的 APl.
   Scaffold 有下面几个主要属性：

   - appBar - 显示在界面顶部的一个 AppBar.
   - body - 当前界面所显示的主要内容 Widget.
   - drawer - 抽屉菜单控件。

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: const Center(
          child: Text('nihao',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.red, fontSize: 40))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Click'),
        backgroundColor: Colors.red[600],
      ),
    ),
  ));
}
```

body 处应该抽出来封装成组件使用。

### Flutter 把内容单独抽离成一个组件

在 Fluter 中自定义组件就是一个类，这个类需要继承 `StatelessWidget/StatefulWidget`

- StatelessWidget 是无状态组件，状态不可变的 widget
- StatefulWidget 是有状态组件，持有的状态可能在 widget 生命周期改变

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: const MyApp(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Click'),
        backgroundColor: Colors.red[600],
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Hello World',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey[600],
            fontFamily: 'IndieFlower',
          )
        )
      )
    );
  }
}
```

### Container、Text 组件

有很多属性，写时再详细看

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            color: Colors.black,
            width: 2
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
        ),
        child: const Text('hello world', style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
        ),
      )
    );
  }
}
```

### Image

- Image.asset 本地图片
- Image.network 网络图片

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.yellow
        ),
        child: Image.network('https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/9960cf5ba0104d68adef26245291c74a~tplv-k3u1fbpfcp-jj-mark:3024:0:0:0:q75.awebp#?w=402&h=390&s=55194&e=png&b=2020fe', )
      )
    );
  }
}
```

### ListView 列表组件

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 20),
        Icon(
          Icons.home,
          size: 40,
          color: Colors.red,
        ),
        SizedBox(height: 20),
        Icon(Icons.settings),
        SizedBox(height: 20),
        Icon(Icons.personal_injury_outlined),
        SizedBox(height: 20),
        Icon(
          Icons.category,
          size: 50,
          color: Colors.blue,
        )
      ],
    );
  }
```

垂直列表

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(title: Text('Item 1')),
        Divider(),
        ListTile(title: Text('Item 1')),
        Divider(),
        ListTile(title: Text('Item 1')),
        Divider()
      ],
    );
  }
}
```

动态列表

```dart
// 使用for循环生成数据
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  List<Widget> _initListData() {
    List<Widget> list = [];
    for (int i = 0; i < 20; i++) {
      list.add(ListTile(
        leading: const Icon(Icons.people),
        title: Text('联系人$i'),
      ));
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _initListData(),
    );
  }
}

// 使用ListView.builder生成数据
class MyApp extends StatelessWidget {
  List<String> list = [];

  MyApp({super.key}) {
    for(int i = 0; i< 20; i++) {
      list.add('第$i条数据');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(list[index]),
        );
      }
    );
  }
}

```

### GridView 网格组件

- 通过 GridView.count()创建一个 GridView，通过指定 crossAxisCount 和 childAspectRatio 两个参数，可以创建一个网格布局。

  ```dart
  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.purple,
            ),
            Container(
              color: Colors.orange,
            )
          ]);
    }
  }
  ```

- 通过 GridView.extent 创建一个固定宽高的网格布局

  ```dart
  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return GridView.extent(
          maxCrossAxisExtent: 80,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.purple,
            ),
            Container(
              color: Colors.orange,
            )
          ]);
    }
  }
  ```

### 页面布局组件 Padding Row Column Flex Expanded

- Row 和 Column 行和列

  ```dart
  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return Container(
        width: double.infinity, // 宽度为屏幕宽度
        height: double.infinity, // 高度为屏幕高度
        color: Colors.black12,
        child: Column(
        // child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconContainer(Icons.home),
            IconContainer(Icons.ac_unit_rounded, color: Colors.blue),
            IconContainer(Icons.search, color: Colors.yellow),
          ])
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
  ```

- Expanded

  必须使用在 Flex 的子组件中

  ```dart
  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(flex: 1, child: IconContainer(Icons.home)),
          Expanded(flex: 2, child: IconContainer(Icons.ac_unit_rounded, color: Colors.blue))
        ]
      );
    }
  }
  ```

### Stack 层叠组件

Stack 组件用于层叠布局，Align 组件用于对齐，Positioned 组件用于定位。

- Stack 与 Align

  ```js
  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return Stack(
        alignment: Alignment.center, // 默认是左上角
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
          ),
          const Text('im flutter'),
          const Text('我是111')
        ],
      );
    }
  }
  ```

- Stack 与 Positioned

  ```dart
  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return Container(
        width: 200,
        height: 200,
        color: Colors.red,
        child: const Stack(
          children: [
            Positioned(
              left: 10,
              top: 100,
              child: Text('hello'))
          ],
        ),
      );
    }
  }
  ```

### AspectRatio Card CircleAvatar

- AspectRatio 控制子元素宽高比，用于控制图片宽高比
- Card 卡片 CircleAvatar 头像

  ```dart
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
                backgroundImage: NetworkImage("https://q2.itc.cn/q_70/images03/20240320/3df8c75302424a05864e62215a548e28.jpeg"),
                radius: 40,
              ),
              const SizedBox(height: 16),
              Text(name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(phone, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      );
    }
  }
  ```

### Button

```dart

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  print('Hello');
                },
                child: const Text('button')),
            TextButton(
                onPressed: () {
                  print('world');
                },
                child: const Text('文字button')),
            OutlinedButton(onPressed: () {}, child: const Text('带边框button')),
            IconButton(
              onPressed: () {
                print('icon');
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
                onPressed: () {},
                label: const Text('button'),
                icon: const Icon(Icons.info)),
            TextButton.icon(
              onPressed: () {},
              label: const Text('带边框button'),
              icon: const Icon(Icons.abc_outlined),
            )
          ],
        )
      ],
    );
  }
}
```

### Wrap 组件

类似于 Row 组件，放不下时自动扩展

### floatingActionButton 浮动按钮

floatingActionButton 是一个组件，在 Scaffold 组件中，用来实现页面的浮动按钮。

通过 floatingActionButtonLocation 属性设置按钮的位置，默认为 FloatingActionButtonLocation.endFloat

### BottomNavigationBar

BottomNavigationBar 是一个组件，在 Scaffold 组件中，用来实现页面的底部导航栏。

```dart
home: Scaffold(
  appBar: AppBar(
    title: Text('My First App'),
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
    ]
  ),
```

### Drawer

Drawer 是一个侧边栏，可以包含一些菜单项，用户可以通过点击菜单项来切换页面。

```dart
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
```

### AppBar

顶部组件，Scaffold 组件的子组件

```dart
appBar: AppBar(
  title: const Text('My First App'),
  centerTitle: true,
  backgroundColor: Colors.red[600],
),
```

## StatefulWidget 有状态组件

StatefulWidget 是有状态的组件，可以保存状态，当状态改变时，会重新渲染组件。

- 创建有状态组件必须继承 `StatefulWidget`
- `StatefulWidget` 中必须实现 `createState` 方法，返回 `State` 对象

通过 `setState` 方法来更新状态

```js
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

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
          Text('$_numberCount', style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: () {
            setState(() {
              _numberCount++;
            });
          }, child: const Text('Increment'))
        ],
      ),
    );
  }
}
```

- 为什么要将 build 方法放在 State 中，而不是放在 StatefulWidget 中？
  - 状态访问不便：每次状态改变都要调用 build 方法，由于状态是保存在 State 中的，如果 build 方法在 StatefulWidget 中，那么 build 方法和状态分别在两个类中，那么构建时读取状态将会很不方便！
  - 继承 StatefulWidget 不便

## 路由

Flutter 中通过 Navigator 组件管理路由导航。

- Navigator.push

  `article: article` 路由传值

  ```dart
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => ArticleDetailPage(article: article),
    ),
  );
  ```

- Navigator.pop

  ```dart
  Navigator.of(context).pop();
  ```

路由有两种配置方式：

### 基本路由

1. 跳转时在对应组件中引入

   ```dart
   import './xxx.dart'
   ```

2. 通过 Navigator.of(context).push()跳转

不需要统一管理，适合小项目

### 命名路由

统一管理

1. main.dart 中配置路由

   引入所有需要配置的路由组件

   ```dart
   import './pages/home.dart';
   import './pages/search.dart';
   ```

2. 在 MaterialApp 组件中通过 routes 属性配置路由

   ```dart
   initialRoute: '/', // 初始路由
   routes: {
     '/': (context) =>  const HomePage(),
     '/search': (context) => const SearchPage(),
   }
   ```

3. 通过 `Navigator.of(context).pushNamed(context, '/search')` 跳转

#### 命名路由传参

1. 配置路由

   ```dart
   Map routes = {
    '/': (context) =>  const HomePage(),
    '/search': (context, {arguments}) => SearchPage(arguments: arguments), // 命名参数传值
   }
   ```

2. 删除 MaterialApp 组件的 routes 属性，添加 onGenerateRoute

   - settings.name: 命名路由名称
   - settings.arguments: 传递的参数

   ```dart
   // 固定写法
   onGenerateRoute: (RouteSettings settings) {
      final String? name = settings.name;
      final Function? pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments !== null) {
          final Route route = MaterialPageRoute(
              builder: (context) => pageContentBuilder(context,
                  arguments: settings.arguments));
                  return route;
        } else {
          final Route route = MaterialPageRoute(
              builder: (context) => pageContentBuilder(context));
            return route;
        }
      }
      return null;
    },
   ```

3. 跳转传值

   ```dart
   Navigator.pushNamed(context, '/search', arguments: {
    "title": '搜索',
    "keyword": 'flutter',
   });
   ```

4. 对应页面接收参数

   通过 `widget` 拿到数据

   ```dart
   class SearchPage extends StatelessWidget {
     final Map arguments;
     const SearchPage({Key? key, required this.arguments}) : super(key: key);

     @override
     State<SearchPage> createState() => _SearchPageState();
   }

   class _SearchPageState extends State<SearchPage> {
    @override
    void initState() {
      super.initState();
      print(widget.arguments);
    }
   }
   ```

5. 封装成组件使用

   ```dart
   // routers/routers.dart

   import 'package:flutter/material.dart';
   import './pages/home.dart';
   import './pages/search.dart';

   // 1. 配置路由
   Map routes = {
    '/': (context) =>  const HomePage(),
    '/search': (context, {arguments}) => SearchPage(arguments: arguments), // 命名参数传值
   }

   // 2. 配置onGenerateRoute 相当于vue的路由守卫，可以做权限判断
   var onGenerateRoute = (RouteSettings settings) {
      final String? name = settings.name;
      final Function? pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments !== null) {
          final Route route = MaterialPageRoute(
              builder: (context) => pageContentBuilder(context,
                  arguments: settings.arguments));
                  return route;
        } else {
          final Route route = MaterialPageRoute(
              builder: (context) => pageContentBuilder(context));
            return route;
        }
      }
      return null;
   }
   ```

   在 main.dart 中引入 onGenerateRoute
