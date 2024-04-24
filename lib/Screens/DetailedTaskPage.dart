import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:taskflow/helper.dart';
import 'package:taskflow/model/Task.dart';
import 'package:taskflow/repository/Project.dart';

import '../Controller/Project.dart';

class DetailedTaskPage extends StatefulWidget {
  Task task;
  String id;
  DetailedTaskPage({required this.task,required this.id}) : super();

  @override
  _DetailedTaskPageState createState() => _DetailedTaskPageState();
}

class _DetailedTaskPageState extends StateMVC<DetailedTaskPage> {
  String status = '';
  late ProjectController _con;
  _DetailedTaskPageState() : super(ProjectController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as ProjectController;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getIndividualEmployeeDetails(int.parse(widget.task.emp_id));
    _con.getAllTask(int.parse(widget.id));
    if(widget.task.status == 'completed'){
      status = 'Completed';
    }
    else{
      status = 'Complete';
    }
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
      ):SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.only(top: 0.0),
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              //color: Colors.red,
              height: 1000,
              width: 400,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 20.0,bottom: 10),
                    child: Container(
                      alignment: Alignment.topLeft,
                      width: 380,
                      child: Text("${widget.task.name}" ,style: TextStyle(
                          color: primarycolor, fontSize: 30,fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                  Container(
                    width: 360,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Assigned to: ${_con.employee.first_name} ${_con.employee.last_name}" ,style: TextStyle(
                            color: Colors.black54, fontSize: 15,fontWeight: FontWeight.bold
                        ),),
                        Text("Department: ${_con.employee.department}" ,style: TextStyle(
                            color: Colors.black54, fontSize: 15,fontWeight: FontWeight.bold
                        ),),
                        Text("Sub-Department: ${_con.employee.sub_department}" ,style: TextStyle(
                            color: Colors.black54, fontSize: 15,fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 30.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffCDF1E5),
                      ),
                      child: widget.task.status == 'completed' ?
                      Text("Conpleted",style: TextStyle(
                          color: Colors.green, fontSize: 22,fontWeight: FontWeight.w500
                      ),) :
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.access_time_rounded,color: Colors.black54,),
                          Text("Deadline:      " ,style: TextStyle(
                              color: Colors.black54, fontSize: 22,fontWeight: FontWeight.w500
                          ),),
                          Text("${widget.task.deadline}" ,style: TextStyle(
                              color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 40.0),
                    child: Container(
                      padding:  EdgeInsets.all( 10.0),
                      alignment: Alignment.topLeft,
                      //color: Colors.red,
                      height: 280,
                      width: 390,
                      child: Text("${widget.task.description}" ,style: TextStyle(
                          color: Colors.black54, fontSize: 18,fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()async{

                      if(UserType.value == 'leader'){
                        await DeleteTask(int.parse(widget.task.id));
                        Navigator.pop(context);
                      };
                      if(widget.task.status == "completed" && UserType.value == 'employee'){

                      }
                      else if(widget.task.status == "incomplete" && UserType.value == 'employee'){
                        await UpdateTask(int.parse(widget.task.id));
                        Navigator.pop(context);
                      }
                      //_con.getAllTask(int.parse(widget.id));
                      //setState(() { });

                    },
                    child:UserType.value == 'employee'&& widget.task.status == 'completed'?Container(): Padding(
                      padding:  EdgeInsets.only(top: 30.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffCDF1E5),
                        ),
                        child: UserType.value == 'leader'? Text('Delete',style: TextStyle(
                            color: Colors.red, fontSize: 19,fontWeight: FontWeight.bold,
                        ),): Text(status,style: TextStyle(
                          color: status == 'Completed'? Colors.green : Colors.green,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),)
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 40.0,bottom: 40),
                    child: Container(
                      padding:  EdgeInsets.only(left: 10) ,
                      alignment: Alignment.topLeft,
                      //color: Colors.red,
                      child: Text("More tasks:" ,style: TextStyle(
                          color: primarycolor, fontSize: 22,fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 400,
                    //color: Colors.deepPurple,
                    child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: completedtasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 90,
                          width: 100,
                          child: GestureDetector(
                            onTap: (){

                            },
                            child: Column(
                              children: [
                                Icon(Icons.file_present_rounded,size: 40,color: Colors.deepOrangeAccent,),
                                Container(
                                  child: Text(_con.tasks[index].name,style: TextStyle(
                                      color: primarycolor, fontSize: 22,fontWeight: FontWeight.bold
                                  ),),
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
