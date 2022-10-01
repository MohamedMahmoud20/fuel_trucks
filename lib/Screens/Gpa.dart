import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Controller/Gps.dart';


// ignore: must_be_immutable
class GpsScreen extends StatefulWidget {

  int index;
  @override
  State<GpsScreen> createState() => _GpsScreenState();

  GpsScreen({
    required this.index,
  });
}

class _GpsScreenState extends State<GpsScreen> {
  var markers=HashSet<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    GoogleMap(
      onMapCreated: (GoogleMapController _GoogleMapController){
        setState(() {
          markers.add(
              Marker(markerId: MarkerId("${Gps[widget.index].id}") ,
                  position: LatLng(Gps[widget.index].Lat, Gps[widget.index].Long),
                  infoWindow: InfoWindow(
                      title: "${Gps[widget.index].name}"
                  )
              )
          );
        });
      },
      markers: markers,
      initialCameraPosition: CameraPosition(
          zoom: 16,
          target:  LatLng(Gps[widget.index].Lat, Gps[widget.index].Long),),)
      ,);
  }
}
