import 'package:flutter/material.dart';
import 'package:uniconnect/screens/Add_Post/add_post_screen_two.dart';

class Dersdisi extends StatefulWidget {
  const Dersdisi({Key? key}) : super(key: key);

  @override
  State<Dersdisi> createState() => _DersdisiState();
}

class _DersdisiState extends State<Dersdisi> {
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
                        color: Color.fromARGB(255, 33, 8, 99),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
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
                              "Ders Dışı",
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
                      Icon(
                        Icons.color_lens,
                        size: 200,
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
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPostScreenTwo(),));
        },
        child: Icon(Icons.add),
        ),
    );
  }
}
