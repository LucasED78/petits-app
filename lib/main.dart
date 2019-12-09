import 'package:flutter/material.dart';
import 'package:petits_app/app/providers/animal_provider.dart';
import 'package:petits_app/app/providers/loading_provider.dart';
import 'package:petits_app/app/widgets/animals/animals_details_screen.dart';
import 'package:petits_app/app/widgets/animals/animals_screen.dart';
import 'package:petits_app/core/petits_scaffold.dart';
import 'package:petits_app/core/petits_theme.dart';
import 'package:petits_app/core/security/keys.dart';
import 'package:petits_app/app/services/animal_service.dart';
import 'package:provider/provider.dart';

void main() {
  final Keys _keys = Keys();
  _keys.init();

  runApp(PetitsApp());
}

class PetitsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AnimalProvider(),
        ),
        ChangeNotifierProvider.value(
          value: LoadingProvider(),
        )
      ],
      child: MaterialApp(
        theme: PetitsTheme.mainTheme,
        home: AnimalsScreen(),
        routes: {
          AnimalsDetailsScreen.routeName: (_) => AnimalsDetailsScreen()
        },
      ),
    );
  }
}
