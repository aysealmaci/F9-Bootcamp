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
      backgroundColor: Color.fromARGB(30, 154, 223, 255),
      body: SafeArea(
        child: SingleChildScrollView(
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
                padding: const EdgeInsets.only(top: 20, left: 20),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ecem Zavar",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Hoş Geldin!",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: appSize.width - 50,
                  height: appSize.height / 5,
                  decoration: BoxDecoration(
                      color: lightBlue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "UniConnect'e\nHoş Geldin!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Lütfen bir kategori seçin!",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: darkBlue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                child: Image.asset("assets/images/Arrow 1.png",
                                    fit: BoxFit.cover),
                              ),
                              Container(
                                width: 80,
                                child: Image.asset(
                                    "assets/images/anasayfaicon.png",
                                    fit: BoxFit.cover),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Kategoriler",
                    style: TextStyle(
                        fontSize: 20,
                        color: darkBlue,
                        fontWeight: FontWeight.bold)),
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
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(color: lightBlue),
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 154, 223, 255),
                                          width: 10),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Image.asset(
                                      "assets/images/ders_ici.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Ders İçi",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: darkBlue,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Dersdisi(),
                      ));
                    },
                    child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(color: lightBlue),
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 154, 223, 255),
                                          width: 10),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Image.asset(
                                      "assets/images/ders_disi.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Ders Dışı",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: darkBlue,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
