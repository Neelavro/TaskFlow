

import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:taskflow/helper.dart';
import 'package:taskflow/model/Project.dart';
import 'package:taskflow/repository/Project.dart';

import '../model/Employee.dart';
import '../model/Task.dart';
import '../repository/Employee.dart';



class ProjectController extends ControllerMVC{
  List projectDetails = [];
  List tasks = [];
  List employeeProject=[];
  Project project = Project();

  bool isLoading = true;
  Employee employee = Employee();

  getIndividualEmployeeDetails(int id) async {
    final Stream<Employee> stream = await getEmployeeDetail(id);

    stream.listen((Employee _employee) {
      setState(() {
        employee = _employee;
      });
    }, onError: (a) {
      print("error from employee details controller --   " + a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      isLoading = false;
      setState(() {});
      // if (message != null) {
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(message),
      // ));
      // }
    });
  }
  getEmployeeProjects(String id) async {
    final Stream<Project> stream = await getProjectForEmployee(id);

    stream.listen((Project _project) {
      setState(() {
        employeeProject.add(_project);
      });
    }, onError: (a) {
      print("error from employee project controller --   " + a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      isLoading = false;
      setState(() {});
      // if (message != null) {
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(message),
      // ));
      // }
    });
  }
  getAllTask(int id) async{
    tasks = [];
    completedtasks = [];
    final Stream<Task> stream = await getTaskInfo(id);

    stream.listen((Task _task) {
      setState(() {
        tasks.add(_task);
      });
    }, onError: (a) {
      print("error from task controller --   "+a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      for(int i =0; i< tasks.length; i++){
        if(tasks[i].status == 'completed'){
          completedtasks.add(tasks[i]);
        }
      }
      isLoading = false;
      setState(() { });
      // if (message != null) {
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(message),
      // ));
      // }
    });
  }
  getAllTaskforEmp(int id) async{
    tasks = [];
    completedtasks = [];
    final Stream<Task> stream = await getTaskInfoforEmp(id);

    stream.listen((Task _task) {
      setState(() {
        tasks.add(_task);
      });
    }, onError: (a) {
      print("error from task controller --   "+a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      for(int i =0; i< tasks.length; i++){
        if(tasks[i].status == 'completed'){
          completedtasks.add(tasks[i]);
        }
      }
      isLoading = false;
      setState(() { });
      // if (message != null) {
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(message),
      // ));
      // }
    });
  }
  getIndividualProject(String leader) async{

    final Stream<Project> stream = await getProject(leader);

    stream.listen((Project _project) {
      setState(() {
        project = _project;
        projectDetails.add(_project);
      });
    }, onError: (a) {
      print("error from individual project controller --   "+a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      project_id.value = int.parse(project.id);
      isLoading = false;
      setState(() { });
      // if (message != null) {
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(message),
      // ));
      // }
    });
  }

}
