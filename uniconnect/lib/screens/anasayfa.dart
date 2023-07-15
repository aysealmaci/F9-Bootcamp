import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uniconnect/Provider/provider.dart';
import 'package:uniconnect/screens/dersdisi.dart';
import 'package:uniconnect/screens/dersici.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userGet();
  }

  userGet() async {
    AppProvider appProvider = Provider.of(context, listen: false);
    await appProvider.providerUserGet();
  }

  static const Color darkBlue = Color(0xff294c92);
  static const Color lightBlue = Color(0xff00b0ff);
  static const Color textColor = Color(0xff2d279d);
  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
              children: [
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
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text("Ecem Zavar"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Hoşgeldiniz")
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: appSize.width * 4 / 4.3,
              height: appSize.height / 5,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 154, 223, 255),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 250, top: 20, bottom: 20),
                child: Column(
                  children: [
                    Text(
                      "Uniconnect'e",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Hoşgeldiniz",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lütfen bir kategori seçin!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Kategoriler"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Dersici(),
                  ));
                },
                child: Container(
                  height: 200,
                  width: appSize.width / 2.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: Colors.black),
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  child: Center(child: Text("Ders İçi")),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Dersdisi(),
                  ));
                },
                child: Container(
                  height: 200,
                  width: appSize.width / 2.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: Colors.black),
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  child: Center(child: Text("Ders Dışı")),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
