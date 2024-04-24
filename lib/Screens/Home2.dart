import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:taskflow/Controller/Employee.dart';
import 'package:taskflow/Screens/CreateTask.dart';
import 'package:taskflow/Screens/DetailedTaskPage.dart';
import 'package:taskflow/Screens/MemberDetails.dart';
import 'package:taskflow/Screens/ProjectDetails.dart';
import 'package:taskflow/Screens/TaskPage.dart';
import 'package:taskflow/helper.dart';
import 'package:taskflow/model/Task.dart';

import '../Controller/Project.dart';
import 'loginPage.dart';

class Home2Page extends StatefulWidget {
  Home2Page({Key?key}) : super(key: key);

  @override
  _Home2PageState createState() => _Home2PageState();
}

class _Home2PageState extends StateMVC<Home2Page> {
  late ProjectController _con;
  _Home2PageState() : super(ProjectController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as ProjectController;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getEmployeeProjects(UserId.value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: _con.isLoading? Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: Center(
                  child: CircularProgressIndicator(
                      color: Colors.red, strokeWidth: 5))),
        ],
      ):Center(
        child: Padding(
          padding:  EdgeInsets.only(top: 0.0),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              //color: Colors.red,
              width: 400,
              child:Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 30.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      width: 380,
                      child: Text("Active Projects:" ,style: TextStyle(
                          color: primarycolor, fontSize: 30,fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 20.0,bottom: 20),
                    child: Container(
                      height: 710,
                      width: 400,
                      //color: Colors.deepPurple,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: _con.employeeProject.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,MaterialPageRoute(builder: (context) =>
                                  ProjectDetailsPage(id: _con.employeeProject[index].id,
                                leader_id: _con.employeeProject[index].leader,)));
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.only(left: 3,right: 3,top: 20),
                              alignment: Alignment.center,
                              height: 150,
                              width: 390,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow:  [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(
                                      0,
                                      2.0,
                                    ),
                                    blurRadius: 3.0,
                                    spreadRadius: 1.0,
                                  ),
                                  // BoxShadow(
                                  //   color: Colors.white,
                                  //   offset: Offset(0.0, 0.0),
                                  //   blurRadius: 10.0,
                                  //   spreadRadius: 0.0,
                                  // ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.file_open_rounded,size: 50,color: Colors.deepOrangeAccent,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text("Name:            ${_con.employeeProject[index].name}",style: TextStyle(
                                          color: primarycolor, fontSize: 19,fontWeight: FontWeight.bold
                                      ),),
                                      Text("Description:  ${_con.employeeProject[index].description}",style: TextStyle(
                                          color: primarycolor, fontSize: 19,fontWeight: FontWeight.bold
                                      ),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
