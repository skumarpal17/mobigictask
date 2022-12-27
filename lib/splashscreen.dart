import 'package:flutter/material.dart';

import 'enter_rows_column.dart';
import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashwait();
  }

  _splashwait() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => EnterRowsColumn() // MyHomePage()
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wd = MediaQuery.of(context).size.width;
    return Material(
      child: SafeArea(
        child: SizedBox(
          height: ht,
          width: wd,
          child: const Center(
            child: Text("Mobigic Pvt Ltd."),
          ),
        ),
      ),
    );
  }
}
