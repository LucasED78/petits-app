import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petits_app/app/model/animal.dart';
import 'package:petits_app/app/widgets/animals/widgets/animal_card_info.dart';
import 'package:petits_app/app/widgets/animals/widgets/animal_card_tag.dart';
import 'package:petits_app/core/widgets/loading.dart';
import 'package:petits_app/utils/string_util.dart';

class AnimalsCard extends StatelessWidget {

 final Animal _animal;

  AnimalsCard(this._animal);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    print(_animal.toJSON());

    return Container(
      width: deviceSize.width * 0.9,
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
              width: deviceSize.width,
              height: deviceSize.height * 0.5,
              fit: BoxFit.cover,
              imageUrl: _animal.photos[0]['large'],
              placeholder: (_, url) => Loading(),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnimalCardInfo(
                  icon: Icons.local_mall,
                  content: _animal.gender,
                  width: deviceSize.width * 0.2,
                ),
                AnimalCardInfo(
                  icon: Icons.local_mall,
                  content: _animal.gender,
                  width: deviceSize.width * 0.2,
                ),
                AnimalCardInfo(
                  icon: Icons.local_mall,
                  content: _animal.gender,
                  width: deviceSize.width * 0.2,
                )
              ],
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(_animal.description, textAlign: TextAlign.justify),
            ),
            if (_animal.tags.isNotEmpty) Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildTags(),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: deviceSize.width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.location_on),
                  Text(StringUtil.buildAddress(_animal.address))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTags() {
    return _animal.tags.map<Widget>((e) => AnimalCardTag(e)).toList();
  }
}
