import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:petits_app/app/model/animal.dart';
import 'package:petits_app/app/providers/animal_provider.dart';
import 'package:petits_app/app/providers/favorites_provider.dart';
import 'package:petits_app/app/providers/user_list_provider.dart';
import 'package:petits_app/app/widgets/animals/widgets/animal_card.dart';
import 'package:petits_app/app/widgets/user_list/user_list_dialog.dart';
import 'package:petits_app/app/widgets/user_list/user_list_modal.dart';
import 'package:petits_app/core/petits_scaffold.dart';
import 'package:provider/provider.dart';

class AnimalsDetailsScreen extends StatelessWidget {
  static const routeName = "animals-detail";

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context).settings.arguments as int;
    Animal _animal = Provider.of<AnimalProvider>(context, listen: false).getByID(id);
    FavoritesProvider _favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
    Provider.of<UserListProvider>(context, listen: false).fetchLists();

    return PetitsScaffold(
      title: _animal.name,
      body: SingleChildScrollView(
        child: AnimalsCard(_animal)
      ),
      speedDial: SpeedDial(
        animatedIcon: AnimatedIcons.menu_home,
        curve: Curves.bounceIn,
        child: Icon(Icons.menu),
        overlayOpacity: 0,
        children: [
          SpeedDialChild(
            child: Consumer<FavoritesProvider>(
              builder: (ctx, fav, _){
                return Icon(fav.has(id) ? Icons.favorite : Icons.favorite_border);
              },
            ),
            onTap: () => _favoritesProvider.toggleFavorite(id),
          ),
          SpeedDialChild(
            child: Icon(Icons.add),
            onTap: () async{
              bool option = await showDialog(
                context: context,
                builder: (_) => UserListDialog()
              );

              if (option != null) showModalBottomSheet(
                  context: context,
                  builder: (_) => UserListModal(animalId: id, create: option)
              );
            }
          )
        ],
      ),
    );
  }
}
