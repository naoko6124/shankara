import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key, required this.code});

  final String? code;

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  Map<String, dynamic> docData = {"value": "0.0"};

  void queryData() {
    var db = FirebaseFirestore.instance;
    db.collection("cards").doc(widget.code).get().then(
      (DocumentSnapshot doc) {
        setState(() {
          docData = doc.data() as Map<String, dynamic>;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    queryData();

    var windowHeight = MediaQuery.of(context).size.height;
    var windowWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Container(
                    width: windowWidth,
                    height: windowHeight,
                    child: Column(
                      children: <Widget>[
                        ClipPath(
                            clipper: HotbarClipper(),
                            child: Container(
                              width: windowWidth,
                              height: windowHeight * 0.3,
                              decoration:
                                  const BoxDecoration(color: Color(0xFF639CD9)),
                              child: Column(children: [
                                SizedBox(
                                  height: 25,
                                  child: Container(),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 12,
                                        child: Center(
                                            child: Text(
                                          "R\$ ${docData['value']}",
                                          style: const TextStyle(
                                              fontSize: 48,
                                              color: Colors.white),
                                        ))),
                                  ],
                                ),
                              ]),
                            )),
                        Center(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              fixedSize:
                                  Size(windowWidth * 0.7, windowHeight * 0.1),
                              backgroundColor: const Color(0xFF639CD9),
                              foregroundColor: const Color(0xFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            onPressed: () => {},
                            child: const Text(
                              'Depositar',
                              style: TextStyle(fontSize: 28),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: windowHeight * 0.1, child: Container()),
                        Center(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              fixedSize:
                                  Size(windowWidth * 0.7, windowHeight * 0.1),
                              backgroundColor: const Color(0xFF639CD9),
                              foregroundColor: const Color(0xFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            onPressed: () => {},
                            child: const Text(
                              'Sacar',
                              style: TextStyle(fontSize: 28),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

class HotbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, 0);

    path.addOval(Rect.fromCenter(
        center: Offset(size.width * 0.2, 0),
        width: size.width * 3,
        height: size.height));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
