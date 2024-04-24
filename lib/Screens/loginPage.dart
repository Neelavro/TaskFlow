import 'package:flutter/material.dart';
import 'package:taskflow/Screens/Home.dart';
import 'package:taskflow/Screens/Home2.dart';
import 'package:taskflow/Screens/UpdatePassword.dart';
import 'package:taskflow/helper.dart';
import 'package:taskflow/repository/Employee.dart';





class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>  {


  final idController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(

        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left:30,top: 100.0),
                    child: Text(
                      "Taskflow",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primarycolor,
                        fontSize: 37,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 100.0,right: 30),
                    child: Container(
                      color: Colors.white,
                      height: 120,
                        width: 120,
                        child: Image.asset('assets/png-transparent-task-project-management-computer-icons-service-others-miscellaneous-text-logo.png',
                        )),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(left:30,top: 0),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primarycolor,
                    fontSize: 35,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 100.0,left: 10,right: 10),
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),

                    controller: idController,
                    decoration: const InputDecoration(
                        prefix: Text("       "),
                        border: InputBorder.none,
                        hintText: "ID",
                      hintStyle: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10,right: 10),
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: passController,
                    obscureText: true,
                    decoration: const InputDecoration(prefix: Text("       "),
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white)
                    ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130.0,top: 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => UpdatePass()));
                  },
                  child: Text("update password?",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 55,left: 30,right: 30),
                child: MaterialButton(
                  onPressed: ()async {
                    //_con.getcurrentUser(emailController.value.text);

                    //var x  = await getCurrentUser(emailController.value.text);
                    var x = await getCurrentUser(int.parse(idController.value.text));
                    if (idController.value.text.isEmpty ||
                        passController.value.text.isEmpty) {
                      final snackBar = SnackBar(
                        content:  Text(
                          'Please fill the required fields', style: TextStyle(color: primarycolor),),
                        backgroundColor: (Colors.white),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {
                            // Navigator.pushNamed(context,'/signup');
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (UserId.value != idController.value.text ||
                        UserPass.value != passController.value.text) {
                      final snackBar = SnackBar(
                        content:  Text(
                            'Incorrect email or password' ,style: TextStyle(color: primarycolor)),
                        backgroundColor: (Colors.white),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {
                            // Navigator.pushNamed(context,'/signup');
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (UserId.value == idController.value.text &&
                        UserPass.value == passController.value.text && UserType.value == 'leader') {
                      print("success");
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => HomePage()));
                    }
                    if (UserId.value == idController.value.text &&
                        UserPass.value == passController.value.text && UserType.value == 'employee') {
                      print("success");
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => Home2Page()));
                    }

                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height*.07,
                    width: MediaQuery.of(context).size.width*.8,
                    decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "log in",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
