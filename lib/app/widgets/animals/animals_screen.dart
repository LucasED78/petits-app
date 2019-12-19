import 'package:flutter/material.dart';
import 'package:petits_app/app/providers/animal_provider.dart';
import 'package:petits_app/app/providers/favorites_provider.dart';
import 'package:petits_app/app/providers/loading_provider.dart';
import 'package:petits_app/app/widgets/animals/animals_list.dart';
import 'package:petits_app/core/petits_scaffold.dart';
import 'package:petits_app/core/widgets/search_bar.dart';
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
      .then((_) async{
        Provider.of<LoadingProvider>(context).loading = true;
        await Provider.of<AnimalProvider>(context).fetchAnimals();
//        await Provider.of<FavoritesProvider>(context).fetchFavorites();
        Provider.of<LoadingProvider>(context).loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    AnimalProvider _animalsProvider = Provider.of<AnimalProvider>(context);
    return PetitsScaffold(
      actions: <Widget>[
        SearchBar()
      ],
      body: RefreshIndicator(
        child: AnimalsList(_animalsProvider.animals),
        onRefresh: Provider.of<AnimalProvider>(context).fetchAnimals,
      ),
    );
  }
}

