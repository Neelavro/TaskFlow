import 'package:flutter/material.dart';
import 'package:taskflow/helper.dart';

import 'loginPage.dart';

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
    _navigatetoHome();
  }
  _navigatetoHome() async {
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png-transparent-task-project-management-computer-icons-service-others-miscellaneous-text-logo.png'),

                )
              ),
            ),
            Text(
              "Taskflow",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primarycolor,
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
