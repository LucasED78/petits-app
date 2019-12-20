import 'package:flutter/material.dart';
import 'package:petits_app/app/providers/user_list_provider.dart';
import 'package:petits_app/app/widgets/user_list/widgets/user_list_title.dart';
import 'package:provider/provider.dart';

class UserLists extends StatelessWidget {

  final int animalId;

  UserLists({ this.animalId });

  @override
  Widget build(BuildContext context) {
    UserListProvider _userListProvider = Provider.of(context);

    return ListView.builder(
      itemCount: _userListProvider.count,
      itemBuilder: (_, i){
        return i < _userListProvider.count - 1 ? Column(
          children: <Widget>[
            UserListTitle(
            id: _userListProvider.userList[i].id,
              name: _userListProvider.userList[i].name,
              animalId: animalId
            ),
            Divider()
          ],
        ) : UserListTitle(
            id: _userListProvider.userList[i].id,
            name: _userListProvider.userList[i].name,
            animalId: animalId
        );
      },
    );
  }
}
