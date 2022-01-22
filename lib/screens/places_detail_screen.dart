import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';
import './map_screen.dart';

class PlacesDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';
  const PlacesDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedPlace.title),
        ),
        body: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.file(
                selectedPlace.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              selectedPlace.location!.address!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => MapScreen(
                      initialLocation: selectedPlace.location!,
                      isSelecting: false,
                    ),
                  ),
                );
              },
              child: const Text('View on Map'),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ));
  }
}
