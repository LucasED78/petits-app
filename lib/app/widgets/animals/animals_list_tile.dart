import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petits_app/app/model/animal.dart';

class AnimalsListTile extends StatelessWidget {

  Animal _animal;

  AnimalsListTile(this._animal);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            imageUrl: _animal.photos.isNotEmpty ? _animal.photos[0]['small'] : "https://cdn2.iconfinder.com/data/icons/dog-2/32/husky-512.png",
            placeholder: (_, url) => CircularProgressIndicator(),
          ),
        ),
        title: Text(_animal.name ?? "Puppy"),
      ),
    );
  }
}
