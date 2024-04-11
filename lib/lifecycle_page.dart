import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class LifeCyclePage extends StatefulWidget{
  const LifeCyclePage({Key? key}) : super(key: key);

  @override
  State<LifeCyclePage> createState()=> PageState();

}
class PageState extends State<LifeCyclePage> with WidgetsBindingObserver{
  //生命周期变化时回调
//  resumed:应用可见并可响应用户操作
//  inactive:用户可见，但不可响应用户操作
//  paused:已经暂停了，用户不可见、不可操作
//  suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint("+++++++++++didChangeAppLifecycleState: $state");
  }
  // 调用次数：多次
  // 初始化时，在initState()之后立刻调用
  // 当依赖的InheritedWidget rebuild,会触发此接口被调用
  // 实测在组件可见状态变化的时候会调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  //调用次数：多次
  // 组件状态改变时候调用
  @override
  void didUpdateWidget(covariant LifeCyclePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
  //调用次数：1次
  //插入渲染树时调用，只调用一次，widget创建执行的第一个方法，这里可以做一些初始化工作，比如初始化State的变量。
  @override
  void initState() {
    super.initState();
    debugPrint("initState......");
  }
  // 当State对象从树中被移除时，会调用此回调，会在dispose之前调用。
  // 页面销毁的时候会依次执行：deactivate > dispose
  @override
  void deactivate() {
    super.deactivate();
  }
  //调用次数：1次==onDestroy();
  // 当State对象从树中被永久移除时调用；通常在此回调中释放资源。
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  //忽略---在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用
  @override
  void reassemble() {
    super.reassemble();
  }
  //调用次数：多次
  // 初始化之后开始绘制界面
  // setState触发的时候会
  @override
  Widget build(BuildContext context) {
    //debugPrint("build......");
    return Scaffold(
      appBar: AppBar(title: const Text('页面生命周期'),),
    );
  }
}