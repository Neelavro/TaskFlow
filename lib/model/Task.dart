

class Task {
  String id = '';
  String project_id = '';
  String name = '';
  String description = '';
  String status = '';
  String deadline = '';
  String emp_id = '';


  Task();

  Task.fromJSON(Map<String, dynamic> jsonMap) {
    jsonMap['id'] != null ? id = jsonMap['id'].toString() : id = '';
    jsonMap['project_id'] != null ? project_id = jsonMap['project_id'].toString() : project_id = '';
    jsonMap['name'] != null
        ? name = jsonMap['name']
        : name = '';
    jsonMap['description'] != null
        ? description = jsonMap['description']
        : description = '';
    jsonMap['status'] != null ? status = jsonMap['status'] : status = '';
    jsonMap['deadline'] != null ? deadline = jsonMap['deadline'] : deadline = '';
    jsonMap['emp_id'] != null ? emp_id = jsonMap['emp_id'].toString() : emp_id = '';

  }
}
