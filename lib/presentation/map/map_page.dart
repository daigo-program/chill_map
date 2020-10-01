import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'map_model.dart';

class MapPage extends StatelessWidget {
  MapPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<MapStore>(
      create: (_) => MapStore(),
      child: GoogleMapState(),
    ));
  }
}

class GoogleMapState extends StatelessWidget {
  GoogleMapState({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mapstore = Provider.of<MapStore>(context);
    return Container(
      child: GoogleMap(
          onMapCreated: mapstore.onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(35.6580339, 139.7016358),
            zoom: 16.0,
          )),
    );
  }
}
