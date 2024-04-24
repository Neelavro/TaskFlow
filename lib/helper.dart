import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:taskflow/repository/Project.dart';

String serverurl = "2a24-103-60-175-15.ngrok-free.app";
Color primarycolor = Color(0xff297373);

getSearchResultData(dynamic data)
{
  print(data);
  return data ?? [];
}
List project_creation = [];
List front = [];
List back = [];
List qa = [];
List acc = [];
List mark = [];
List fin = [];

void calculate(List x){
  for(int i = 0; i<x.length; i++){
    print(int.parse(x[i].id));
    createProjectMember(int.parse(x[i].id), project_id.value, x[i].first_name, x[i].last_name);
  }
}
ValueNotifier<int> project_id = ValueNotifier(0);

ValueNotifier<String> UserId = ValueNotifier("");
List completedtasks = [];


ValueNotifier<String> UserPass = ValueNotifier("");

ValueNotifier<String> UserType = ValueNotifier("");





