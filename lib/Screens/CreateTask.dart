import 'package:flutter/material.dart';
import 'package:taskflow/Screens/Project_Create.dart';
import 'package:taskflow/helper.dart';

import '../repository/Project.dart';

class TaskCreationPage extends StatefulWidget {
  final String id;
  TaskCreationPage({required this.id}) : super();

  @override
  State<TaskCreationPage> createState() => _TaskCreationPageState();
}

class _TaskCreationPageState extends State<TaskCreationPage> {

  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();
  TextEditingController t3 = new TextEditingController();
  TextEditingController t4 = new TextEditingController();
  TextEditingController t5 = new TextEditingController();
  TextEditingController t6 = new TextEditingController();

  FocusNode _focus = new FocusNode();
  FocusNode _focus2 = new FocusNode();
  FocusNode _focus3 = new FocusNode();
  FocusNode _focus4 = new FocusNode();
  FocusNode _focus5 = new FocusNode();
  FocusNode _focus6 = new FocusNode();



  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    _focus2.addListener(_onFocusChange);
    // _con.getAuthData();
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus2.removeListener(_onFocusChange);
    _focus3.removeListener(_onFocusChange);
    _focus4.removeListener(_onFocusChange);
    _focus5.removeListener(_onFocusChange);
    _focus6.removeListener(_onFocusChange);

    _focus.dispose();
    _focus2.dispose();
    _focus3.dispose();
    _focus4.dispose();
    _focus5.dispose();
    _focus6.dispose();

  }
  void _onFocusChange() {
    setState(() {

    });

    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text("Taskflow"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 25.0),
              child: Container(
                alignment: Alignment.topLeft,
                width: 400,
                child: Text("Create tasks and assign to your employees!",style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold, color: primarycolor
                ),),
              ),
            ),
            Container(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0,right:55),
              child: Container(
                alignment: Alignment.topLeft,
                height:50,
                width: 300,
                child: Row(
                  children: [
                    Text("Task Name:",style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    Container(
                      width: 20,
                    ),
                    Container(
                        width: 150,
                        child: TextField(
                          controller: t1,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0,left:26),
              child: Container(
                alignment: Alignment.centerRight,
                height:50,
                width: 400,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    Text("Task Description:",style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    Container(
                      width: 10,
                    ),
                    Container(
                        width: 150,
                        child: TextField(
                          controller: t2,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0,left:26),
              child: Container(
                alignment: Alignment.centerRight,
                height:50,
                width: 400,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    Text("Employee ID:",style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    Container(
                      width: 10,
                    ),
                    Container(
                        width: 150,
                        child: TextField(
                          controller: t3,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0,left:26),
              child: Container(
                alignment: Alignment.centerRight,
                height:50,
                width: 400,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    Text("Deadline:",style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    Container(
                      width: 10,
                    ),
                    Container(
                        width: 150,
                        child: TextField(
                          controller: t4,
                        )),
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Container(
                  height: 70,
                  width: 260,
                  decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: TextButton(
                      onPressed: ()async{
                        await createTask(int.parse(widget.id), t1.value.text, t2.value.text,
                            'incomplete', t4.value.text, int.parse(t3.value.text));
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Create Task',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20
                        ),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
