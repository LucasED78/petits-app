import 'package:flutter/material.dart';
import 'package:petits_app/app/providers/animal_provider.dart';
import 'package:petits_app/core/widgets/rounded_text_field.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  double _width = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size _deviceSize = MediaQuery.of(context).size;
    final AnimalProvider _animalProvider = Provider.of<AnimalProvider>(context);

    return Expanded(
      child: Row(
        children: <Widget>[
          SizedBox(
            width: _deviceSize.width * 0.1,
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                setState(() {
                  _width = _deviceSize.width * 0.8;
                });
              },
            ),
          ),
          AnimatedContainer(
            alignment: Alignment.topLeft,
            width: _width,
            height: _deviceSize.height * 0.05,
            curve: Curves.linearToEaseOut,
            duration: Duration(seconds: 1),
            child: Form(
              key: _formKey,
              child: RoundedTextField(
                validator: (String v){
                  if (v.isEmpty) return "please provida a value";
                  return null;
                },
                onChanged: (v) async{
                  _animalProvider.search = v;
                  await _animalProvider.fetchAnimals();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
