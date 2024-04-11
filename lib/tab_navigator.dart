import 'package:flutter/material.dart';
import 'package:flutter_multi_app/lifecycle_page.dart';
import 'package:flutter_multi_app/personal_main_page.dart';
import 'package:flutter_multi_app/refresh_page.dart';

///App框架Widget
class TabNavigator extends StatefulWidget{
  const TabNavigator({Key? key}) : super(key: key);
  @override
  State<TabNavigator> createState() {
    return TabNavigatorState();
  }
}

class TabNavigatorState extends State<TabNavigator>{
  final _defaultCorlor=Colors.grey;
  final _activeCorlor=Colors.blue;
  int _currentIndex=0;
  final PageController _controller=PageController(initialPage: 0);

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: const [
          LifeCyclePage(),
          RefreshMainPage(),
          LifeCyclePage(),
          PersonalMainPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _defaultCorlor,
              ),
              activeIcon: Icon(
                Icons.home,
                color: _activeCorlor,
              ),
              label: '首页'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.class_outlined,
                color: _defaultCorlor,
              ),
              activeIcon: Icon(
                Icons.class_outlined,
                color: _activeCorlor,
              ),
              label: '分类'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: _defaultCorlor,
              ),
              activeIcon: Icon(
                Icons.shopping_cart,
                color: _activeCorlor,
              ),
              label: '购物车'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _defaultCorlor,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: _activeCorlor,
              ),
              label: '我的'
          ),
      ],
        selectedItemColor: _activeCorlor,
        unselectedItemColor: _defaultCorlor,
        currentIndex: _currentIndex,
        onTap: (index)=>{
          _setCurrentIndex(index)
        },
      ),
    );
  }
  void _setCurrentIndex(int index){
    _controller.jumpToPage(index);
    setState(
        ()=>{
          _currentIndex=index
        }
    );
  }
  @override
  void dispose() {

  }
}