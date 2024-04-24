
import 'package:http/http.dart' as http;
import 'package:taskflow/model/Employee.dart';
import 'package:taskflow/model/Project.dart';
import 'dart:convert';

import '../helper.dart';
import '../model/Task.dart';

Future<void> createProject( String name, String description,int leader_id) async {
  Uri url = Uri.parse("https://2a24-103-60-175-15.ngrok-free.app/createproject"); //int// z = int.parse(r);
  final response = await http.post(
    url,
    body: json.encode({
      "name": name,
      "description": description,
      "leader_id": leader_id,
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    // Successful POST request
    print('Post request successful');
    print('Response: ${response.body}');
  } else {
    // Error in POST request
    print('Failed to make POST request. Status code: ${response.statusCode}');
  }
}
Future<void> createProjectMember( int id, int project_id, String first_name, String last_name) async {
  Uri url = Uri.parse("https://2a24-103-60-175-15.ngrok-free.app/createprojectmember"); //int// z = int.parse(r);
  final response = await http.post(
    url,
    body: json.encode({
      "id": id,
      "project_id": project_id,
      "first_name": first_name,
      "last_name": last_name
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    // Successful POST request
    print('Post request successful');
    print('Response: ${response.body}');
  } else {
    // Error in POST request
    print('Failed to make POST request. Status code: ${response.statusCode}');
  }
}

Future<Stream<Project>> getProject(String leader) async {

  Uri url = Uri.http(serverurl, 'projectdetails/$leader');

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', url));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => getSearchResultData(data))
      .expand((data) => (data as List))
      .map((data) => Project.fromJSON(data));

}
Future<Stream<Project>> getProjectForEmployee(String id) async {

  Uri url = Uri.http(serverurl, 'employeeprojects/$id');

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', url));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => getSearchResultData(data))
      .expand((data) => (data as List))
      .map((data) => Project.fromJSON(data));

}
Future<Stream<Task>> getTaskInfo(int id) async {

  Uri url = Uri.http(serverurl, 'tasks/$id');

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', url));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => getSearchResultData(data))
      .expand((data) => (data as List))
      .map((data) => Task.fromJSON(data));

}
Future<Stream<Task>> getTaskInfoforEmp(int id) async {

  Uri url = Uri.http(serverurl, 'emptasks/$id');

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', url));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => getSearchResultData(data))
      .expand((data) => (data as List))
      .map((data) => Task.fromJSON(data));

}

Future<bool> DeleteTask(int id) async {
  bool isDeleted = false;
  Uri url = Uri.parse("https://2a24-103-60-175-15.ngrok-free.app/task/$id");

  try {
    http.Response response = await http.delete(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      if (result['message'] == "deleted successfully") {
        isDeleted = true;
      }
    }
  } catch (e) {
    //print('Error deleting task: $e');
    // Handle errors (e.g., connection issues, server errors) here
    // You might want to log the error or perform error-specific handling
  }

  return isDeleted;
}

Future<void> createTask( int project_id, String name, String description, String status,String deadline, int emp_id) async {
  Uri url = Uri.parse("https://2a24-103-60-175-15.ngrok-free.app/createtask"); //int// z = int.parse(r);
  final response = await http.post(
    url,
    body: json.encode({
      "project_id": project_id,
      "name": name,
      "description": description,
      "status" : status,
      "deadline":deadline,
      "emp_id":emp_id
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    // Successful POST request
    print('Post request successful');
    print('Response: ${response.body}');
  } else {
    // Error in POST request
    print('Failed to make POST request. Status code: ${response.statusCode}');
  }
}

Future<bool> UpdateTask(int id) async {
  bool isUpdated = false;
  Uri url = Uri.parse("https://2a24-103-60-175-15.ngrok-free.app/task/$id");

  try {
    http.Response response = await http.put(url,
      body: json.encode({
        "emp_id": int.parse(UserId.value),
        "status": "completed"
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



