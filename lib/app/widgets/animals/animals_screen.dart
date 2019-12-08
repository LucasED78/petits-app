import 'package:flutter/material.dart';
import 'package:petits_app/app/model/animal.dart';
import 'package:petits_app/app/providers/animal_provider.dart';
import 'package:petits_app/app/widgets/animals/animals_list.dart';
import 'package:petits_app/core/petits_scaffold.dart';
import 'package:provider/provider.dart';

class AnimalsScreen extends StatefulWidget {
  @override
  _AnimalsScreenState createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 2))
      .then((_) => Provider.of<AnimalProvider>(context).fetchAnimals());
  }

  @override
  Widget build(BuildContext context) {
    AnimalProvider _animalsProvider = Provider.of<AnimalProvider>(context);
    print(_animalsProvider.animalsCount);
    return PetitsScaffold(
      title: "teste",
      body: AnimalsList(_animalsProvider.animals),
    );
  }
}

