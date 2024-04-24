

class Employee {
  String id = '';
  String first_name = '';
  String last_name = '';
  String email = '';
  String address = '';
  String phone = '';
  String nid = '';
  String department = '';
  String sub_department = '';


  Employee();

  Employee.fromJSON(Map<String, dynamic> jsonMap) {
    jsonMap['id'] != null ? id = jsonMap['id'].toString() : id = '';
    jsonMap['first_name'] != null ? first_name = jsonMap['first_name'] : first_name = '';
    jsonMap['last_name'] != null
        ? last_name = jsonMap['last_name']
        : last_name = '';
    jsonMap['email'] != null
        ? email = jsonMap['email']
        : email = '';
    jsonMap['address'] != null ? address = jsonMap['address'] : address = '';
    jsonMap['phone_number'] != null ? phone = jsonMap['phone_number'] : phone = '';
    jsonMap['nid'] != null ? nid = jsonMap['nid'] : nid = '';
    jsonMap['department'] != null ? department = jsonMap['department'] : department = '';
    jsonMap['sub_department'] != null ? sub_department = jsonMap['sub_department'] : sub_department = '';



  }
}
