import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:petits_app/app/model/user_list.dart';
import 'package:petits_app/app/services/user_list_service.dart';

class UserListProvider with ChangeNotifier {
  List<UserList> _userLists;

  List<UserList> get userList => _userLists;

  int get count => _userLists.length;

  UserList getByID(String id) => _userLists.firstWhere((ul) => ul.id == id);

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

  Future<void> appendToList(String id, int animalId) async{
    if (id.isNotEmpty) {
      final UserList userList = getByID(id);

      userList.animals.add(animalId);

      notifyListeners();

      try {
        await UserListService().addToList(id, userList.toJSON());
      }catch(e){
        userList.animals.removeLast();
        notifyListeners();
      }
    }
  }
}