import 'package:flutter/material.dart';
import 'package:petits_app/app/model/animal.dart';
import 'package:petits_app/app/providers/animal_provider.dart';
import 'package:petits_app/app/widgets/animals/animals_list_tile.dart';
import 'package:petits_app/core/widgets/scrollable_list.dart';
import 'package:provider/provider.dart';

class AnimalsList extends StatelessWidget {

  final List<Animal> _animals;

  AnimalsList(this._animals);

  @override
  Widget build(BuildContext context) {
    return InfiniteScrollableList(
      itemCount: _animals.length,
      itemBuilder: (_, i){
        return _buildListItem(i);
      },
      onBottomReached: () async{
        print(Provider.of<AnimalProvider>(context).limit);
        Provider.of<AnimalProvider>(context).limit = 20;
        await Provider.of<AnimalProvider>(context).fetchLastAnimals();
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
