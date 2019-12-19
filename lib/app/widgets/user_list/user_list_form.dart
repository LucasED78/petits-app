import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petits_app/app/model/user.dart';
import 'package:petits_app/app/model/user_list.dart';
import 'package:petits_app/app/providers/user_list_provider.dart';
import 'package:provider/provider.dart';

class UserListForm extends StatefulWidget {
  final int animalId;

  UserListForm({ @required this.animalId });

  @override
  _UserListFormState createState() => _UserListFormState();
}

class _UserListFormState extends State<UserListForm> {
  UserList _userList = UserList(owner: User(), animals: []);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      child: Form(
        key: _formKey,
        child: TextFormField(
          decoration: InputDecoration(
              labelText: "list name"
          ),
          validator: (v){
            if (v.isEmpty) return "please provide a value";
            return null;
          },
          onSaved: (v){
            _userList.name = v;
            _userList.animals.add(widget.animalId);
          },
          onFieldSubmitted: (v) => _submit(),
        ),
      ),
    );
  }

  void _submit() async{
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await Provider.of<UserListProvider>(context, listen: false).createList(_userList);
    }
  }
}
