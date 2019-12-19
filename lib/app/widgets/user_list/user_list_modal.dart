import 'package:flutter/material.dart';
import 'package:petits_app/app/widgets/user_list/user_list_form.dart';
import 'package:petits_app/app/widgets/user_list/user_lists.dart';

class UserListModal extends StatefulWidget {
  final int animalId;
  final bool create;

  UserListModal({
    @required this.animalId,
    @required this.create
  });

  @override
  _UserListModalState createState() => _UserListModalState();
}

class _UserListModalState extends State<UserListModal> {
  @override
  Widget build(BuildContext context) {
    return widget.create ? UserListForm(animalId: widget.animalId) : UserLists();
  }
}
