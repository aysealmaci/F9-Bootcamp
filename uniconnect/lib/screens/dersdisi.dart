import 'package:flutter/material.dart';
import 'package:uniconnect/screens/Add_Post/add_post_screen.dart';
import 'package:uniconnect/screens/Add_Post/add_post_screen_two.dart';
import 'package:uniconnect/screens/anasayfa.dart';
import 'package:uniconnect/screens/profile_page.dart';

class Dersdisi extends StatefulWidget {
  const Dersdisi({Key? key}) : super(key: key);

  @override
  State<Dersdisi> createState() => _DersdisiState();
}

class _DersdisiState extends State<Dersdisi> {
  static const Color darkBlue = Color(0xff294c92);
  static const Color lightBlue = Color(0xff00b0ff);
  static const Color textColor = Color(0xff2d279d);
  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: appSize.height / 2.5,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 154, 223, 255),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "UniConnect",
                        style: TextStyle(
                            fontFamily: "Lobster",
                            fontSize: 30,
                            color: darkBlue),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            height: 37,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Geri",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                            },
                            child: CircleAvatar(
                              backgroundColor: Color(0xffE6E6E6),
                              radius: 30,
                              child: Icon(
                                Icons.person,
                                size: 35,
                                color: Color.fromARGB(255, 53, 73, 255),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ders Dışı",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 7, 33, 72)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Faliyetler Bölümüne\nHoş Geldin!",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 100,
                            child: Image.asset(
                              "assets/images/Arrow2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 70,
                            child: Image.asset(
                              "assets/images/ders_disi.png",
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
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
