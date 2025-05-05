import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String? _mapStyle;

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  Future<void> _loadMapStyle() async {
    final String style =
        await rootBundle.loadString('assets/mapstyle/mapstyle.json');
    if (!mounted) return;
    setState(() {
      _mapStyle = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(41.0082, 28.9784),
        zoom: 5,
      ),
      markers: _markers,
      onMapCreated: (GoogleMapController controller) {
        _mapController = controller;
        if (_mapStyle != null) {
          _mapController.setMapStyle(_mapStyle);
        }
      },
      onTap: (LatLng pos) {
        setState(() {
          _markers.add(Marker(
            position: pos,
            markerId: const MarkerId("Location"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange),
          ));
        });
      },
    );
  }
}
