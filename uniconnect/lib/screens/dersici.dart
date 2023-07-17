import 'package:flutter/material.dart';
import 'package:uniconnect/screens/Add_Post/add_post_screen.dart';

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
       return SafeArea(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: Container(
                  padding: EdgeInsets.only(right: 12),
                  child: 
                  widget.snap['profImage'] == null ? CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage:
                        NetworkImage('https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60'), // Profil resmi
                    radius: 30,
                  ) : 
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage:
                        NetworkImage(widget.snap['profImage']), // Profil resmi
                    radius: 30,
                  ),
                ),
                title: Text(
                  widget.snap['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('mesaj.'),
                trailing: Icon(Icons.more_horiz),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  widget.snap['description'],
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Image.network(
                'https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60', // Kullanıcının paylaştığı fotoğraf
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: _isLiked
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(Icons.favorite_border),
                          onPressed: _toggleLike,
                        ),
                        IconButton(
                          icon: _isSaved
                              ? Icon(Icons.bookmark, color: Colors.blue)
                              : Icon(Icons.bookmark_border),
                          onPressed: _toggleSave,
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.comment),
                      onPressed: _addComment,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      '$_commentCount yorum',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
       ),
       ),
    );

  }
}
