class Project {
  String id = '';
  String name = '';
  String description = '';
  String leader = '';


  Project();

  Project.fromJSON(Map<String, dynamic> jsonMap) {
    jsonMap['id'] != null ? id = jsonMap['id'].toString() : id = '';
    jsonMap['name'] != null ? name = jsonMap['name'] : name = '';
    jsonMap['description'] != null
        ? description = jsonMap['description']
        : description = '';
    jsonMap['leader_id'] != null
        ? leader = jsonMap['leader_id'].toString()
        : leader = '';


  }
}