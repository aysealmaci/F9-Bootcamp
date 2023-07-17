import 'package:flutter/material.dart';
import 'package:uniconnect/screens/Add_Post/add_post_screen.dart';
import 'package:uniconnect/screens/profile_page.dart';

class Dersici extends StatefulWidget {
  final snap;
  const Dersici({Key? key,required this.snap}) : super(key: key);

  @override
  State<Dersici> createState() => _DersiciState();
}

class _DersiciState extends State<Dersici> {
  static const Color darkBlue = Color(0xff294c92);
  static const Color lightBlue = Color(0xff00b0ff);
  static const Color textColor = Color(0xff2d279d);

  bool _isLiked = false;
  bool _isSaved = false;
  int _commentCount = 0;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void _toggleSave() {
    setState(() {
      _isSaved = !_isSaved;
    });
  }

  void _addComment() {
    setState(() {
      _commentCount++;
    });
  }





  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;

    );

  }
}
