import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:taskflow/Controller/Employee.dart';
import 'package:taskflow/Screens/CreateTask.dart';
import 'package:taskflow/Screens/DetailedTaskPage.dart';
import 'package:taskflow/Screens/MemberDetails.dart';
import 'package:taskflow/helper.dart';

import '../Controller/Project.dart';

class MembersPage extends StatefulWidget {
  String id;
  MembersPage({required this.id}) : super();

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends StateMVC<MembersPage> {
  late EmployeeController _con;
  _MembersPageState() : super(EmployeeController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as EmployeeController;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _con.getAllProjectMember(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text("Taskflow"),
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
                      child: Text("Project Members:" ,style: TextStyle(
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
                        itemCount: _con.projectmembers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,MaterialPageRoute(builder: (context) =>  MemberDetailsPage(member_ID: _con.projectmembers[index].id)));
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
                                  Icon(Icons.person_outline_rounded,size: 60,color: Colors.deepOrangeAccent,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("ID:  ${_con.projectmembers[index].id}",style: TextStyle(
                                          color: primarycolor, fontSize: 19,fontWeight: FontWeight.bold
                                      ),),
                                      Text("First Name:  ${_con.projectmembers[index].first_name}",style: TextStyle(
                                          color: primarycolor, fontSize: 19,fontWeight: FontWeight.bold
                                      ),),
                                      Text("Last Name:  ${_con.projectmembers[index].last_name}",style: TextStyle(
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
