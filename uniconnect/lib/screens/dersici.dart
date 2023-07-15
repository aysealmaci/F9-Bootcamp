import 'package:flutter/material.dart';
import 'package:uniconnect/screens/Add_Post/add_post_screen.dart';

class Dersici extends StatefulWidget {
  const Dersici({Key? key}) : super(key: key);

  @override
  State<Dersici> createState() => _DersiciState();
}

class _DersiciState extends State<Dersici> {
  static const Color darkBlue = Color(0xff294c92);
  static const Color lightBlue = Color(0xff00b0ff);
  static const Color textColor = Color(0xff2d279d);
  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: appSize.height / 2.4,
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
                        fontFamily: "Lobster", fontSize: 30, color: darkBlue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 37,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
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
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 60,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: CircleAvatar(
                          backgroundColor: Color(0xffE6E6E6),
                          radius: 30,
                          child: Icon(
                            Icons.person,
                            size: 35,
                            color: Color.fromARGB(255, 53, 73, 255),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Ders İçi",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 7, 33, 72)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Faliyetler Bölümüne",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 7, 33, 72)),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Hoşgeldiniz!",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 7, 33, 72)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Image.asset(
                          "assets/images/ders_ici.png",
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
