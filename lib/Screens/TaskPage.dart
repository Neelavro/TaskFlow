
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:taskflow/Screens/CreateTask.dart';
import 'package:taskflow/Screens/DetailedTaskPage.dart';
import 'package:taskflow/helper.dart';

import '../Controller/Project.dart';

class TaskPage extends StatefulWidget {
  String id;
   TaskPage({required this.id}) : super();

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends StateMVC<TaskPage> {
  late ProjectController _con;
  _TaskPageState() : super(ProjectController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as ProjectController;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getAllTask(int.parse(widget.id));
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

              child:_con.tasks.isEmpty? Text("No tasks added yet"): Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 40.0,bottom: 30),
                    child: Container(
                      alignment: Alignment.topLeft,
                      width: 380,
                      child: Text("Pending Tasks:" ,style: TextStyle(
                          color: primarycolor, fontSize: 30,fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                  Container(
                    height: 470,
                    width: 400,
                    //color: Colors.deepPurple,

                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: _con.tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _con.tasks[index].status == "incomplete"? Container(
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
                                    ).then((value) {setState(() {_con.getAllTask(int.parse(widget.id));});});

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
                        ):Container();
                      },
                    ),
                  ),
                  Container(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(
                            0,
                            1.0,
                          ),
                          blurRadius: 2.0,
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
                    child: ExpansionTile(
                      collapsedBackgroundColor: Color(0xffF5FEFD),
                      backgroundColor: Color(0xffF5FEFD),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Completed',style: TextStyle(
                              color: primarycolor, fontSize: 22,fontWeight: FontWeight.bold
                          ),),
                          Icon(Icons.task_alt_outlined,color: Colors.green,)
                        ],
                      ),
                      children: <Widget>[
                       // ListTile(title: Text("asdads"),),
                        Container(
                          height: 190,
                          width: 500,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: completedtasks.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: ()async{
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  DetailedTaskPage(task: completedtasks[index],id: widget.id,)),
                                  ).then((value) {setState(() {_con.getAllTask(int.parse(widget.id));});});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Container(
                                    height: 50,
                                    width: 390,
                                    child: Row(
                                      children: [
                                        Icon(Icons.file_present_rounded,size: 30,color: Colors.deepOrangeAccent,),
                                        Text(completedtasks[index].name,style: TextStyle(
                                            color: primarycolor, fontSize: 20,fontWeight: FontWeight.bold
                                        ),),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primarycolor,
        onPressed: () async{  Navigator.push(
          context,
         await  MaterialPageRoute(builder: (context) =>  TaskCreationPage(id: widget.id,)),
        ).then((value) {setState(() {_con.getAllTask(int.parse(widget.id));});}); },
        child: Icon(Icons.add),
      ),
    );
  }
}
