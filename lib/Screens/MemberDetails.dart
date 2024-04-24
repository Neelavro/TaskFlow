import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Controller/Employee.dart';
import '../helper.dart';

class MemberDetailsPage extends StatefulWidget {
  final String member_ID;
  MemberDetailsPage({required this.member_ID}) : super();

  @override
  _MemberDetailsPageState createState() => _MemberDetailsPageState();
}

class _MemberDetailsPageState extends StateMVC<MemberDetailsPage> {
  late EmployeeController _con;
  _MemberDetailsPageState() : super(EmployeeController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as EmployeeController;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getIndividualEmployeeDetails(int.parse(widget.member_ID));
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
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            //color: Colors.red,
            width: 400,
            child:Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(bottom: 20.0,top: 40),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 380,
                    child: Text("Official Info:" ,style: TextStyle(
                        color: primarycolor, fontSize: 30,fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Row(
                  children: [
                    Text("ID:                          ",style: TextStyle(
                    color: primarycolor, fontSize: 21,fontWeight: FontWeight.bold
                ),),
                    Text("${_con.employee.id}",style: TextStyle(
                        color: Colors.black, fontSize: 21,fontWeight: FontWeight.w500
                    ),),
                  ],
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
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 30.0),
                  child: Divider(height: 1,thickness: 1,color: Colors.black,),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 380,
                    child: Text("Contact Info:" ,style: TextStyle(
                        color: primarycolor, fontSize: 30,fontWeight: FontWeight.bold
                    ),),
                  ),
                ),

                Row(
                  children: [
                    Text("Phone number: ",style: TextStyle(
                        color: primarycolor, fontSize: 21,fontWeight: FontWeight.bold
                    ),),
                    Text("${_con.employee.phone}",style: TextStyle(
                        color: Colors.black, fontSize: 21,fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Text("Email:                  ",style: TextStyle(
                        color: primarycolor, fontSize: 21,fontWeight: FontWeight.bold
                    ),),
                    Container(
                      //color: Colors.black,
                      width: 217,
                      child: Text("${_con.employee.email}",style: TextStyle(
                          color: Colors.black, fontSize: 21,fontWeight: FontWeight.w500
                      ),),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 30.0),
                  child: Divider(height: 1,thickness: 1,color: Colors.black,),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 380,
                    child: Text("Personal Info:" ,style: TextStyle(
                        color: primarycolor, fontSize: 30,fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Row(
                  children: [
                    Text("NID:                    ",style: TextStyle(
                        color: primarycolor, fontSize: 23,fontWeight: FontWeight.bold
                    ),),
                    Text("${_con.employee.nid}",style: TextStyle(
                        color: Colors.black, fontSize: 23,fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Text("Address:            ",style: TextStyle(
                        color: primarycolor, fontSize: 23,fontWeight: FontWeight.bold
                    ),),
                    Text("${_con.employee.address}",style: TextStyle(
                        color: Colors.black, fontSize: 23,fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
