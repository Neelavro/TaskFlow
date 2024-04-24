import 'package:flutter/material.dart';
import 'package:taskflow/Screens/Project_Create.dart';
import 'package:taskflow/helper.dart';

import '../repository/Project.dart';

class ProjectCreation1 extends StatefulWidget {
  const ProjectCreation1({Key? key}) : super(key: key);

  @override
  State<ProjectCreation1> createState() => _ProjectCreation1State();
}

class _ProjectCreation1State extends State<ProjectCreation1> {

  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();
  FocusNode _focus = new FocusNode();
  FocusNode _focus2 = new FocusNode();

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
    _focus.dispose();
    _focus2.dispose();
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
                child: Text("Give your project a name and description!",style: TextStyle(fontSize: 30,
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
                    Text("Project Name:",style: TextStyle(fontSize: 20,
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
                    Text("Project Description:",style: TextStyle(fontSize: 20,
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
                      onPressed: (){
                        //print(t1.value.text);
                        createProject(t1.value.text, t2.value.text,int.parse(UserId.value));
                        Navigator.pushAndRemoveUntil<void>(
                          context,
                          MaterialPageRoute<void>(builder: (BuildContext context) =>  CreateProject()),
                          ModalRoute.withName('/'),
                        );
                      },
                      child: Text(
                        'Create Project and Add members',
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
