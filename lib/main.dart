import 'package:flutter/material.dart';
import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '愿票无忧',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartApp(),
    );
  }
}

class StartApp extends StatefulWidget {
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp>
    with SingleTickerProviderStateMixin {
  var loginState;

  AnimationController _animationController;
  Animation _animation;

  void initState() {
    super.initState();
    //创建动画控制器
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    _animation = Tween(begin: 1.0, end: 1.0).animate(_animationController);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //
        //这边的添加动画的监听，当动画5秒后的状态是completed完成状态，则执行这边的代码，跳转到登录页，或者其他页面
        //
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animation,
        child: ConstrainedBox(
            //让他的child充满整个屏幕
            constraints: BoxConstraints.expand(),
            child: Stack(
              //
              children: <Widget>[
                Container(
                  height: double.infinity,
                  //这边放一张图用于显示5秒的底图，这张图和上面的图一样，这样就有连贯起来的效果了
                  child: Image.asset('assets/image/start_bg.jpg',
                      scale: 1.0, fit: BoxFit.fill),
                ),
                Positioned(
                  top: 50.0,
                  right: 20.0,
                  child: OutlineButton(
                    color: Colors.white,
                    highlightColor: null,
                    splashColor: null,
                    // borderSide: new BorderSide(color: Color(0xFFfffffff)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: new Text("跳过",
                        textAlign: TextAlign.center,
                        style:
                            new TextStyle(color: Colors.black, fontSize: 18)),
                    onPressed: () {
                      _animationController.dispose();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                      //当点击跳过按钮的时候，则执行这边的代码，跳转到登录页，或者其他页面
                    },
                  ),
                )
              ],
            )));
  }
}
