import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:taskflow/Controller/Employee.dart';
import 'package:taskflow/Screens/CreateTask.dart';
import 'package:taskflow/Screens/DetailedTaskPage.dart';
import 'package:taskflow/Screens/MemberDetails.dart';
import 'package:taskflow/helper.dart';

import '../Controller/Project.dart';

class ProjectDetailsPage extends StatefulWidget {
  String id;
  String leader_id;
  ProjectDetailsPage({required this.id, required this.leader_id}) : super();

  @override
  _ProjectDetailsPageState createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends StateMVC<ProjectDetailsPage> {
  late ProjectController _con;
  _ProjectDetailsPageState() : super(ProjectController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as ProjectController;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _con.getAllTaskforEmp(int.parse(UserId.value));
    _con.getIndividualEmployeeDetails(int.parse(widget.leader_id));
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
          padding:  EdgeInsets.only(top: 20.0),
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            //color: Colors.red,
            height: 800,
            width: 400,
            child:Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 0.0,bottom: 30),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 380,
                    child: Text("Project Leader info:" ,style: TextStyle(
                        color: primarycolor, fontSize: 30,fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Row(
                  children: [
                    Text("Name:                    ",style: TextStyle(
                        color: primarycolor, fontSize: 21,fontWeight: FontWeight.bold
                    ),),
                    Text("${_con.employee.first_name} ${_con.employee.last_name}",style: TextStyle(
                        color: Colors.black, fontSize: 21,fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Text("Department:         ",style: TextStyle(
                        color: primarycolor, fontSize: 21,fontWeight: FontWeight.bold
                    ),),
                    Text("${_con.employee.department}",style: TextStyle(
                        color: Colors.black, fontSize: 21,fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Text("Sub Department: ",style: TextStyle(
                        color: primarycolor, fontSize: 21,fontWeight: FontWeight.bold
                    ),),
                    Text("${_con.employee.sub_department}",style: TextStyle(
                        color: Colors.black, fontSize: 21,fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Text("Phone number:    ",style: TextStyle(
                        color: primarycolor, fontSize: 21,fontWeight: FontWeight.bold
                    ),),
                    Text("${_con.employee.phone}",style: TextStyle(
                        color: Colors.black, fontSize: 21,fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Text("Email:                     ",style: TextStyle(
                        color: primarycolor, fontSize: 21,fontWeight: FontWeight.bold
                    ),),
                    Container(
                      //color: Colors.black,
                      width: 202,
                      child: Text("${_con.employee.email}",style: TextStyle(
                          color: Colors.black, fontSize: 21,fontWeight: FontWeight.w500
                      ),),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 40.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 380,
                    child: Text("Project Tasks:" ,style: TextStyle(
                        color: primarycolor, fontSize: 30,fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                _con.tasks.isEmpty? Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text("No tasks added yet",style: TextStyle(
                      color: Colors.black, fontSize: 21,fontWeight: FontWeight.w500
                  ),),
                ):
                Container(
                  height: 490,
                  width: 400,
                  //color: Colors.deepPurple,
                  child: ListView.builder(
                    itemCount: _con.tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        width: 390,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  DetailedTaskPage(task: _con.tasks[index],id: widget.id,)),
                                ).then((value) {setState(() {    _con.getAllTaskforEmp(int.parse(UserId.value));
                                ;});});

                              },
                              child: Row(
                                children: [
                                  Icon(Icons.file_present_rounded,size: 40,color: Colors.deepOrangeAccent,),
                                  Text(_con.tasks[index].name,style: TextStyle(
                                      color: primarycolor, fontSize: 22,fontWeight: FontWeight.bold
                                  ),),
                                ],
                              ),
                            ),
                            Icon(Icons.task_alt, size: 40, color:_con.tasks[index].status == 'completed'? Colors.green:Colors.red,)
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
