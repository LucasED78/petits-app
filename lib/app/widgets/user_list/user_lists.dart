import 'package:flutter/material.dart';
import 'package:petits_app/app/providers/user_list_provider.dart';
import 'package:provider/provider.dart';

class UserLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserListProvider _userListProvider = Provider.of(context);

    return ListView.builder(
      itemCount: _userListProvider.count,
      itemBuilder: (_, i){
        return Text(_userListProvider.userList[i].name);
      },
    );
  }
}
