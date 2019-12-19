import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:petits_app/app/model/user_list.dart';
import 'package:petits_app/app/services/user_list_service.dart';

class UserListProvider with ChangeNotifier {
  List<UserList> _userLists;

  List<UserList> get userList => _userLists;

  int get count => _userLists.length;

  Future<void> createList(UserList userList) async{
    Response response = await UserListService().createList(userList.toJSON());

    userList.id = response.data['name'];

    notifyListeners();
  }

  Future<void> fetchLists() async{
    final userList = await UserListService().getLists();

    if (userList != null) {
      _userLists = userList;
    }
    else _userLists = [];

    notifyListeners();
  }
}