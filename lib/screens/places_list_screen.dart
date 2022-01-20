import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your places'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: Consumer<GreatPlaces>(
          child: const Center(
            child: Text(
              'Got no places yet!!',
            ),
          ),
          builder: (context, greatPlaces, child) => greatPlaces.items.isEmpty
              ? child!
              : ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(greatPlaces.items[index].image),
                    ),
                    title: Text(greatPlaces.items[index].title),
                    onTap: () {
                      // go to the detail page
                    },
                  ),
                  itemCount: greatPlaces.items.length,
                ),
        )
        //    Center(
        //   child: CircularProgressIndicator(),
        // ),
        );
  }
}
