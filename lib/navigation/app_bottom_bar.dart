import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuData {
  // 标签
  final String label;

  // 图标数据
  final IconData icon;

  const MenuData({
    required this.label,
    required this.icon,
  });
}

class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final List<MenuData> menus;
  final ValueChanged<int>? onItemTap;

  const AppBottomBar({
    Key? key,
    this.onItemTap,
    this.currentIndex = 0,
    required this.menus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      onTap: onItemTap,
      currentIndex: currentIndex, // 当前选中
      elevation: 3,
      type: BottomNavigationBarType.fixed, // 如果底部有4个或4个以上的菜单时，需要配置这个属性
      iconSize: 22,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      items: menus.map(_buildItemByMenuMeta).toList(),
    );
  }

  BottomNavigationBarItem _buildItemByMenuMeta(MenuData menu) {
    return BottomNavigationBarItem(
      label: menu.label,
      icon: Icon(menu.icon),
    );
  }
}
