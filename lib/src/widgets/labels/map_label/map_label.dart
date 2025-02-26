import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class MapLabel extends StatefulWidget {
  const MapLabel({super.key});

  @override
  State<MapLabel> createState() => _MapLabelState();
}

class _MapLabelState extends State<MapLabel> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(41.0082, 28.9784),
        zoom: 5,
      ),
      markers: _markers,
      onMapCreated: (GoogleMapController controller) {
        _mapController = controller;
      },
      onTap: (LatLng pos) {
        setState(() {
          _markers.add(Marker(
            position: pos,
            markerId: MarkerId("Location"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange),
          ));
        });
      },
    );
  }
}
