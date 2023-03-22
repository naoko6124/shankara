import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shankara_app/card.dart';
import 'package:shankara_app/scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var windowHeight = MediaQuery.of(context).size.height;
    var windowWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Center(
                  child: Container(
                    width: windowWidth * 0.7,
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
                SizedBox(
                  height: windowHeight * 0.6,
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: Size(windowWidth * 0.7, windowHeight * 0.1),
                      backgroundColor: const Color(0xFF639CD9),
                      foregroundColor: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    ),
                    onPressed: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const CardPage(
                                  code: "KkJuStSIsgP8D7ukqArw",
                                )),
                      )
                    },
                    child: const Text(
                      'Escanear\nCartão',
                      style: TextStyle(fontSize: 28),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
