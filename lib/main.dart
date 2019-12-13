import 'package:flutter/material.dart';
import 'package:petits_app/app/providers/animal_provider.dart';
import 'package:petits_app/app/providers/auth_provider.dart';
import 'package:petits_app/app/providers/favorites_provider.dart';
import 'package:petits_app/app/providers/loading_provider.dart';
import 'package:petits_app/app/widgets/animals/animals_details_screen.dart';
import 'package:petits_app/app/widgets/animals/animals_list.dart';
import 'package:petits_app/app/widgets/animals/animals_screen.dart';
import 'package:petits_app/app/widgets/auth/login_screen.dart';
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
          value: AuthProvider(),
        ),
        ChangeNotifierProvider.value(
          value: AnimalProvider(),
        ),
        ChangeNotifierProvider.value(
          value: LoadingProvider(),
        ),
        ChangeNotifierProvider.value(
          value: FavoritesProvider(),
        )
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) {
          return MaterialApp(
            theme: PetitsTheme.mainTheme,
            home: auth.isAuthenticated ? AnimalsScreen() : LoginScreen(),
            routes: {
              AnimalsDetailsScreen.routeName: (_) => AnimalsDetailsScreen()
            },
          );
        },
      ),
    );
  }
}
