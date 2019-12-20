import 'package:flutter/material.dart';
import 'package:petits_app/app/providers/user_list_provider.dart';
import 'package:provider/provider.dart';

class UserListTitle extends StatelessWidget {

  final String id;
  final String name;
  final int animalId;

  UserListTitle({
    @required this.id,
    @required this.name,
    @required this.animalId
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      onTap: () async{
        await Provider.of<UserListProvider>(context).appendToList(id, animalId);
      },
    );
  }
}
