import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:taskflow/Controller/Project.dart';
import 'package:taskflow/model/Accounts.dart';
import 'package:taskflow/model/Backend.dart';
import 'package:taskflow/model/Employee.dart';
import 'package:taskflow/model/Marketing.dart';
import 'package:taskflow/model/FrontEnd.dart';
import 'package:taskflow/model/ProjectMember.dart';
import 'package:taskflow/repository/Employee.dart';

import '../model/Finance.dart';
import '../model/QA.dart';

class EmployeeController extends ProjectController{
  List frontDevs = [];
  List backend = [];
  List finance = [];
  List accounts = [];
  List marketing = [];
  List qa = [];

  bool isLoading = true;
  FrontEnd front = FrontEnd();
  Employee employee = Employee();
  List projectmembers = [];
  getIndividualEmployeeDetails(int id) async {
    final Stream<Employee> stream = await getEmployeeDetail(id);

    stream.listen((Employee _employee) {
      setState(() {
        employee = _employee;
      });
    }, onError: (a) {
      print("error from getAllBook controller --   " + a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      print(frontDevs);
      isLoading = false;
      setState(() {});
      // if (message != null) {
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(message),
      // ));
      // }
    });
  }
  getAllProjectMember(String id) async{

    final Stream<ProjectMember> stream = await getProjectMember(id);

    stream.listen((ProjectMember _projectmember) {
      setState(() {
        projectmembers.add(_projectmember);
      });
    }, onError: (a) {
      print("error from getAllBook controller --   "+a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      print(projectmembers);
      isLoading = false;
      setState(() { });
      // if (message != null) {
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(message),
      // ));
      // }
    });
  }
  getAllFronEnd() async{

    final Stream<FrontEnd> stream = await getFrontEnd();

    stream.listen((FrontEnd frontEnd) {
      setState(() {
        frontDevs.add(frontEnd);
      });
    }, onError: (a) {
      print("error from getAllBook controller --   "+a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      print(frontDevs);
      isLoading = false;
      setState(() { });
      // if (message != null) {
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(message),
      // ));
      // }
    });
  }
  getAllBackend() async{

    final Stream<Backend> stream = await getBackendEnd();

    stream.listen((Backend dev) {
      setState(() {
        backend.add(dev);
      });
    }, onError: (a) {
      print("error from getAllBook controller --   "+a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      print(backend);
      isLoading = false;
      setState(() { });
      // if (message != null) {
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(message),
      // ));
      // }
    });
  }
  getAllQA() async{

    final Stream<QA> stream = await getQA();

    stream.listen((QA dev) {
      setState(() {
        qa.add(dev);
      });
    }, onError: (a) {
      print("error from getAllBook controller --   "+a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      print(qa);
      isLoading = false;
      setState(() { });
      // if (message != null) {
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(message),
      // ));
      // }
    });
  }
  getAllFinance() async{

    final Stream<Finance> stream = await getFinance();

    stream.listen((Finance dev) {
      setState(() {
        finance.add(dev);
      });
    }, onError: (a) {
      print("error from getAllBook controller --   "+a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      print(finance);
      isLoading = false;
      setState(() { });
      // if (message != null) {
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(message),
      // ));
      // }
    });
  }
  getAllAccounts() async{

    final Stream<Accounts> stream = await getAccounts();

    stream.listen((Accounts dev) {
      setState(() {
        accounts.add(dev);
      });
    }, onError: (a) {
      print("error from getAllBook controller --   "+a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      print(accounts);
      isLoading = false;
      setState(() { });
      // if (message != null) {
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(message),
      // ));
      // }
    });
  }
  getAllMarketing() async{

    final Stream<Marketing> stream = await getMarketting();

    stream.listen((Marketing dev) {
      setState(() {
        marketing.add(dev);
      });
    }, onError: (a) {
      print("error from getAllBook controller --   "+a.toString());
      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text(S.of(context).verify_your_internet_connection),
      // ));
    }, onDone: () {
      print(marketing);
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
