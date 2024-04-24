import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:taskflow/Controller/Project.dart';
import 'package:taskflow/Screens/Members.dart';
import 'package:taskflow/Screens/Project_Create.dart';
import 'package:taskflow/Screens/Project_creation1.dart';
import 'package:taskflow/Screens/TaskPage.dart';
import 'package:taskflow/Screens/loginPage.dart';
import 'package:taskflow/helper.dart';
import 'package:taskflow/model/FrontEnd.dart';
import 'package:taskflow/model/Task.dart';
import 'package:taskflow/repository/Employee.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  late ProjectController _con;
  _HomePageState() : super(ProjectController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as ProjectController;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getIndividualEmployeeDetails(int.parse(UserId.value));
    _con.getIndividualProject(UserId.value);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Taskflow"),
            GestureDetector(
              onTap: (){
                UserId.value = '';
                UserPass.value = '';
                UserType.value = '';
                Navigator.pushAndRemoveUntil<void>(
                  context,
                  MaterialPageRoute<void>(builder: (BuildContext context) =>  Login()),
                  ModalRoute.withName('/'),
                );
              },
                child: Icon(Icons.logout_rounded,color: Colors.white,
                ))
          ],
        ),
      ),
      body:_con.isLoading? Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: Center(
                  child: CircularProgressIndicator(
                      color: Colors.red, strokeWidth: 5))),
        ],
      ):SingleChildScrollView(
        child: Column(
          children: [
            _con.projectDetails.isEmpty? Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Container(
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProjectCreation1()),
                        );
                      },
                      child: Text('Create Project +',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20
                      ),)),
                ),
              ),
            ): Center(
              child: Padding(
                padding:  EdgeInsets.only(top: 20.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(15),
                  //color: Colors.red,
                  height: 700,
                  width: 400,
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: 40.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          width: 380,
                          child: Text("Hello" ,style: TextStyle(
                              color: primarycolor, fontSize: 15,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 0.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          width: 380,
                          child: Text("${_con.employee.first_name} ${_con.employee.last_name},",style: TextStyle(
                              color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 20.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          width: 380,
                          child: Text("Your Poject:",style: TextStyle(
                              color: primarycolor, fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 20.0),
                        child: Container(
                          height: 400,
                          width: 390,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: primarycolor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: 20.0),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  width: 380,
                                  child: Text("Name:           ${_con.project.name}  ",style: TextStyle(
                                      color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold
                                  ),),
                                ),
                              ),
                              Container(
                                //color: Colors.green,
                                alignment: Alignment.topLeft,
                                width: 380,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text("Description:  ${_con.project.description} ",style: TextStyle(
                                      color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold
                                  ),),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: 50.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  MembersPage(id: _con.project.id)),
                                        );
                                      },
                                      child: Container(
                                        height: 130,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.person_pin_rounded, color: Colors.deepPurple,size: 40,),
                                            Text('See Members',style: TextStyle(
                                                color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  TaskPage(id: _con.project.id)),
                                        );
                                      },
                                      child: Container(
                                        height: 130,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.task_rounded, color: Colors.deepOrangeAccent,size: 40,),
                                            Text('See Tasks',style: TextStyle(
                                                color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold
                                            ),),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
              ],
            )
        ),
      );
  }
}
