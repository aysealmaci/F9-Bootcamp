import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uniconnect/screens/Add_Post/add_post_screen.dart';
import 'package:uniconnect/screens/dersici.dart';

class DersiciMain extends StatefulWidget {
  const DersiciMain({Key? key}) : super(key: key);

  @override
  State<DersiciMain> createState() => _DersiciMainState();
}

class _DersiciMainState extends State<DersiciMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UniConnect', style: TextStyle(fontFamily: 'Lobster', fontSize: 25,color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: CupertinoButton(onPressed: () {
          Navigator.of(context).pop();
        },child: Icon(Icons.arrow_back,color: Colors.black,)),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60'),
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('DersiçiPost').orderBy('datePublished', descending: true).snapshots(),
        builder: (context, AsyncSnapshot <QuerySnapshot<Map<String,dynamic>>> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => Dersici(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddPostScreen(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}