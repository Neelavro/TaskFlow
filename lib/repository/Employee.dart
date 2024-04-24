
import 'dart:convert';

import  'package:http/http.dart' as http;
import 'package:taskflow/helper.dart';
import 'package:taskflow/model/Accounts.dart';
import 'package:taskflow/model/Backend.dart';
import 'package:taskflow/model/Employee.dart';
import 'package:taskflow/model/Finance.dart';
import 'package:taskflow/model/Marketing.dart';
import 'package:taskflow/model/FrontEnd.dart';
import 'package:taskflow/model/ProjectMember.dart';

import '../model/QA.dart';



Future<Stream<Employee>> getEmployeeDetail(int id) async {

  Uri url = Uri.http(serverurl, 'employee/$id');

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', url));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => getSearchResultData(data))
      .expand((data) => (data as List))
      .map((data) => Employee.fromJSON(data));

}
Future<Stream<FrontEnd>> getFrontEnd() async {

  Uri url = Uri.http(serverurl, 'frontend');

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', url));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => getSearchResultData(data))
      .expand((data) => (data as List))
      .map((data) => FrontEnd.fromJSON(data));

}
Future<Stream<Backend>> getBackendEnd() async {

  Uri url = Uri.http(serverurl, 'backend');

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', url));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => getSearchResultData(data))
      .expand((data) => (data as List))
      .map((data) => Backend.fromJSON(data));

}
Future<Stream<QA>> getQA() async {

  Uri url = Uri.http(serverurl, 'qa');

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', url));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => getSearchResultData(data))
      .expand((data) => (data as List))
      .map((data) => QA.fromJSON(data));

}
Future<Stream<Accounts>> getAccounts() async {

  Uri url = Uri.http(serverurl, 'accounts');

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', url));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => getSearchResultData(data))
      .expand((data) => (data as List))
      .map((data) => Accounts.fromJSON(data));

}
Future<Stream<Finance>> getFinance() async {

  Uri url = Uri.http(serverurl, 'finance');

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', url));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => getSearchResultData(data))
      .expand((data) => (data as List))
      .map((data) => Finance.fromJSON(data));

}
Future<Stream<Marketing>> getMarketting() async {

  Uri url = Uri.http(serverurl, 'marketing');

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', url));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => getSearchResultData(data))
      .expand((data) => (data as List))
      .map((data) => Marketing.fromJSON(data));

}
Future<Stream<ProjectMember>> getProjectMember(String id) async {

  Uri url = Uri.http(serverurl, 'projectmember/$id');

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', url));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => getSearchResultData(data))
      .expand((data) => (data as List))
      .map((data) => ProjectMember.fromJSON(data));

}

getCurrentUser(int id) async {
  final response = await http.get(Uri.parse('https://2a24-103-60-175-15.ngrok-free.app/login/$id'));
  var result = jsonDecode(response.body);
  print(result);
  UserId.value = result[0]['id'].toString();
  UserPass.value = result[0]['password'].toString();
  UserType.value = result[0]['type'];
  print(UserPass.value);
  if (response.statusCode == 200) {
    // Successful POST request
    print('Post request successful');
    print('Response: ${response.body}');
  } else {
    // Error in POST request
    print('Failed to make POST request. Status code: ${response.statusCode}');
  }
  return result;

}

Future<bool> UpdateP(int id,String password) async {
  bool isUpdated = false;
  Uri url = Uri.parse("https://2a24-103-60-175-15.ngrok-free.app/login/$id");

  try {
    http.Response response = await http.put(url,
      body: json.encode({
        "password": password
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      if (result['message'] == "updated successfully") {
        isUpdated = true;
      }
    }
  } catch (e) {
    //print('Error deleting task: $e');
    // Handle errors (e.g., connection issues, server errors) here
    // You might want to log the error or perform error-specific handling
  }

  return isUpdated;
}