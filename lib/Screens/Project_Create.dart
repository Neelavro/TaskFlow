import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:taskflow/Controller/Employee.dart';
import 'package:taskflow/Screens/Home.dart';
import 'package:taskflow/helper.dart';
import 'package:taskflow/model/Accounts.dart';
import 'package:taskflow/model/Backend.dart';
import 'package:taskflow/model/Finance.dart';
import 'package:taskflow/model/Marketing.dart';
import 'package:taskflow/model/FrontEnd.dart';
import 'package:taskflow/repository/Employee.dart';

import '../model/QA.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({Key? key}) : super(key: key);

  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends StateMVC<CreateProject> {
  late EmployeeController _con;
  _CreateProjectState() : super(EmployeeController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as EmployeeController;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getAllFronEnd();
    _con.getAllBackend();
    _con.getAllQA();
    _con.getAllAccounts();
    _con.getAllFinance();
    _con.getAllMarketing();
    _con.getIndividualProject(UserId.value);

  }
  @override
  Widget build(BuildContext context) {
    FrontEnd? fron= FrontEnd();
    Backend? bac = Backend();
    QA? q = QA();
    Accounts? ac = Accounts();
    Marketing? m = Marketing();
    Finance? f = Finance();


    return Scaffold(
      backgroundColor: Colors.white,
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
      ):Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0,left: 20),
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Text('Submit the following form to create add members',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primarycolor,
                      fontSize: 20
                  ),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 7.0,right: 200),
                child: Text('Select Front-end:',
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: DropdownButton(
                    hint: Text('Front-End'),
                    items: _con.frontDevs.map((e){
                      return DropdownMenuItem(
                          value: e,
                          child: Text(e.first_name+' '+e.last_name,
                            style:TextStyle(
                                color: Colors.black
                            ),)
                      );
                    }
                    ).toList(),
                    onChanged: (value){
                      fron = value as FrontEnd?;
                      project_creation.add(fron);
                      front.add(fron);
                      setState(() { });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: Container(
                  height: front.isNotEmpty? front.length*50:0,
                  width: front.isNotEmpty?150:0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: front.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: primarycolor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            height: 30,
                            child: Center(child: Text(front[index].first_name,style: TextStyle(color: Colors.white),))),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: Text('Select Backend:',
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: DropdownButton(
                    hint: Text('Back-End'),
                    items: _con.backend.map((e){
                      return DropdownMenuItem(
                          value: e,
                          child: Text(e.first_name+' '+e.last_name,
                            style:TextStyle(
                                color: Colors.black
                            ),)
                      );
                    }
                    ).toList(),
                    onChanged: (value){
                      bac = value as Backend?;
                      project_creation.add(bac);
                      back.add(bac);
                      setState(() { });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: Container(
                  height: back.isNotEmpty? back.length*50:0,
                  width: back.isNotEmpty?150:0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: back.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: primarycolor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            height: 30,
                            child: Center(child: Text(back[index].first_name,style: TextStyle(color: Colors.white),))),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: Text('Select QA:',
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: DropdownButton(
                    hint: Text('QA'),
                    items: _con.qa.map((e){
                      return DropdownMenuItem(
                          value: e,
                          child: Text(e.first_name+' '+e.last_name,
                            style:TextStyle(
                                color: Colors.black
                            ),)
                      );
                    }
                    ).toList(),
                    onChanged: (value){
                      q = value as QA?;
                      project_creation.add(q);
                      qa.add(q);
                      setState(() { });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: Container(
                  height: qa.isNotEmpty? qa.length*50:0,
                  width: qa.isNotEmpty?150:0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: qa.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: primarycolor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            height: 30,
                            child: Center(child: Text(qa[index].first_name,style: TextStyle(color: Colors.white),))),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: Text('Select Accounts:',
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: DropdownButton(
                    hint: Text('Accounts'),
                    items: _con.accounts.map((e){
                      return DropdownMenuItem(
                          value: e,
                          child: Text(e.first_name+' '+e.last_name,
                            style:TextStyle(
                                color: Colors.black
                            ),)
                      );
                    }
                    ).toList(),
                    onChanged: (value){
                      ac = value as Accounts?;
                      project_creation.add(ac);
                      acc.add(ac);
                      setState(() { });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: Container(
                  height: acc.isNotEmpty? acc.length*50:0,
                  width: acc.isNotEmpty?150:0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: acc.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: primarycolor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            height: 30,
                            child: Center(child: Text(acc[index].first_name,style: TextStyle(color: Colors.white),))),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: Text('Select Finance:',
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: DropdownButton(
                    hint: Text('Finance'),
                    items: _con.finance.map((e){
                      return DropdownMenuItem(
                          value: e,
                          child: Text(e.first_name+' '+e.last_name,
                            style:TextStyle(
                                color: Colors.black
                            ),)
                      );
                    }
                    ).toList(),
                    onChanged: (value){
                      f = value as Finance?;
                      project_creation.add(f);
                      fin.add(f);
                      print(project_creation);
                      setState(() { });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: Container(
                  height: fin.isNotEmpty? fin.length*50:0,
                  width: fin.isNotEmpty?150:0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: fin.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: primarycolor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            height: 30,
                            child: Center(child: Text(fin[index].first_name,style: TextStyle(color: Colors.white),))),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: Text('Select Marketing:',
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: DropdownButton(
                    hint: Text('Marketing'),
                    items: _con.marketing.map((e){
                      return DropdownMenuItem(
                          value: e,
                          child: Text(e.first_name+' '+e.last_name,
                            style:TextStyle(
                                color: Colors.black
                            ),)
                      );
                    }
                    ).toList(),
                    onChanged: (value){
                      m = value as Marketing?;
                      project_creation.add(m);
                      mark.add(m);
                      print(project_creation);
                      setState(() { });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 200),
                child: Container(
                  height: mark.isNotEmpty? mark.length*50:0,
                  width: mark.isNotEmpty?150:0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: mark.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: primarycolor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            height: 30,
                            child: Center(child: Text(mark[index].first_name,style: TextStyle(color: Colors.white),))),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Center(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextButton(
                        onPressed: (){
                          calculate(project_creation);
                          Navigator.pushAndRemoveUntil<void>(
                            context,
                            MaterialPageRoute<void>(builder: (BuildContext context) =>  HomePage()),
                            ModalRoute.withName('/'),
                          );
                        },
                        child: Text('Submit',style: TextStyle(
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
      ),
    );
  }
}
