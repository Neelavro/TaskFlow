

class Accounts {
  String id = '';
  String first_name = '';
  String last_name = '';
  String email = '';
  String phone = '';


  Accounts();

  Accounts.fromJSON(Map<String, dynamic> jsonMap) {
    jsonMap['id'] != null ? id = jsonMap['id'].toString() : id = '';
    jsonMap['first_name'] != null ? first_name = jsonMap['first_name'] : first_name = '';
    jsonMap['last_name'] != null
        ? last_name = jsonMap['last_name']
        : last_name = '';
    jsonMap['email'] != null
        ? email = jsonMap['email']
        : email = '';
    jsonMap['phone'] != null ? phone = jsonMap['phone'] : phone = '';


  }
}
