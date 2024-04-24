

class ProjectMember {
  String id = '';
  String project_id = '';
  String first_name = '';
  String last_name = '';



  ProjectMember();

  ProjectMember.fromJSON(Map<String, dynamic> jsonMap) {
    jsonMap['id'] != null ? id = jsonMap['id'].toString() : id = '';
    jsonMap['project_id'] != null ? project_id = jsonMap['project_id'].toString() : project_id = '';
    jsonMap['first_name'] != null ? first_name = jsonMap['first_name'] : first_name = '';
    jsonMap['last_name'] != null
        ? last_name = jsonMap['last_name']
        : last_name = '';




  }
}
