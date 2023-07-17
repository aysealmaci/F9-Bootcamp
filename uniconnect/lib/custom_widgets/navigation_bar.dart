import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:uniconnect/screens/Add_Post/add_post_screen.dart';
import 'package:uniconnect/screens/anasayfa.dart';
import 'package:uniconnect/screens/profile_page.dart';

class A extends StatefulWidget {
  const A({Key? key}) : super(key: key);

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color(0xff00b0ff),
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: Container(
          //  color: Color(0xff00b0ff),
          child: getSelected(index: _page),
        ));
  }

  Widget getSelected({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = AnaSayfa();
        break;
      case 1:
        widget = AddPostScreen();
        break;
      case 2:
        widget = ProfilePage();
        break;

      default:
        widget = AnaSayfa();
        break;
    }
    return widget;
  }
}
