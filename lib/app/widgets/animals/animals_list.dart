import 'package:flutter/material.dart';
import 'package:petits_app/app/model/animal.dart';
import 'package:petits_app/app/widgets/animals/animals_list_tile.dart';

class AnimalsList extends StatelessWidget {

  final List<Animal> _animals;

  AnimalsList(this._animals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _animals.length,
      itemBuilder: (_, i){
        return _buildListItem(i);
      },
    );
  }

  Widget _buildListItem(int index) {
    if (index < _animals.length - 1) {
      return Column(
        children: <Widget>[
          AnimalsListTile(_animals[index]),
          Divider()
        ],
      );
    }
    else return AnimalsListTile(_animals[index]);
  }
}
