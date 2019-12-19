import 'package:dio/dio.dart';
import 'package:petits_app/app/model/user.dart';
import 'package:petits_app/app/model/user_list.dart';
import 'package:petits_app/core/http/firebase_http.dart';
import 'package:petits_app/core/http/http_api.dart';

class UserListService {
  Future<Response> createList(Map<String, dynamic> userListData) async{
    return await FirebaseHttp().call("/usr${User().id}/lists", HttpMethod.POST, data: userListData);
  }

  Future<List<UserList>> getLists() async{
    Response response = await FirebaseHttp().get(path: "/usr${User().id}/lists");

    List<UserList> _userList = [];

    Map<String, dynamic>.from(response.data).forEach((k, v){
      _userList.add(
        UserList.fromJSON({ "id": k, ...v })
      );
    });

    return _userList;
  }
}