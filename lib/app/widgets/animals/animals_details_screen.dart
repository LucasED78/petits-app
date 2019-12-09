import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petits_app/app/model/animal.dart';
import 'package:petits_app/app/providers/animal_provider.dart';
import 'package:petits_app/app/widgets/animals/widgets/animal_card.dart';
import 'package:petits_app/core/petits_scaffold.dart';
import 'package:petits_app/core/widgets/loading.dart';
import 'package:provider/provider.dart';

class AnimalsDetailsScreen extends StatelessWidget {
  static const routeName = "animals-detail";

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    int id = ModalRoute.of(context).settings.arguments as int;
    Animal _animal = Provider.of<AnimalProvider>(context, listen: false).getByID(id);

    return PetitsScaffold(
      title: _animal.name,
      body: SingleChildScrollView(
        child: AnimalsCard(_animal)
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}
