// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, avoid_unnecessary_containers, deprecated_member_use

import 'dart:async';

import 'package:bella_app/constants.dart';
import 'package:bella_app/models/meals.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/link.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  MapsState createState() => MapsState();
}

class MapsState extends State<Maps> {
  final Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  List<Meals> MEALS_DATA = [];

  double zoomVal = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _buildGoogleMap(context),
            Column(
              children: [_zoomplusfunction(), _zoomminusfunction()],
            ),
            _buildContainer(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _add();
    super.initState();
  }

  Widget myDetailsContainer1(Meals meals) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            meals.name,
            style: const TextStyle(color: Colors.black54, fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                meals.rating.toString(),
                style: const TextStyle(color: Colors.orange, fontSize: 20.0, fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                width: 8,
              ),
              RatingBar.builder(
                initialRating: meals.rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                updateOnDrag: false,
                ignoreGestures: true,
                itemSize: 35,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 10,
                ),
                onRatingUpdate: (double value) {},
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                  child: Text(
                "(${meals.numberOrders})",
                style: const TextStyle(color: Colors.orange, fontSize: 20.0, fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            meals.deis,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
            ),
          ),
        ),
        Link(
          uri: Uri.parse('https://www.google.com/maps/dir/?api=1&destination=${meals.name}'),
          target: LinkTarget.blank,
          builder: (context, followLink) {
            return ElevatedButton(
              onPressed: followLink,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(colorPrimary),
              ),
              child: const Text("Direction"),
            );
          },
        )
      ],
    );
  }

  void _add() async {
    var dio = Dio();
    var response = await dio.get("${siteUrl}apiv1/wisata");
    var data = response.data['data'];
    for (var i = 0; i < data.length; i++) {
      Meals meals = Meals(data[i]['nama'], data[i]['id_wisata'], data[i]['informasi'], data[i]['file'], data[i]['review'], double.parse(data[i]['latitude']), double.parse(data[i]['longitude']), double.parse(data[i]['rating']));
      MEALS_DATA.add(meals);
    }
    for (int i = 0; i < MEALS_DATA.length; i++) {
      final MarkerId markerId = MarkerId(MEALS_DATA[i].id);
      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(MEALS_DATA[i].long, MEALS_DATA[i].lat),
        onTap: () {},
      );
      if (mounted) {
        setState(() {
          markers[markerId] = marker;
        });
      }
    }
  }

  Widget _boxes(Meals meals) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(meals.lat, meals.long);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: FittedBox(
          child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), bottomLeft: Radius.circular(24)),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage("${siteUrl}assets/img/wisata/${meals.image}"),
                      ),
                    ),
                  ),
                  Container(
                    width: 340,
                    height: 200,
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 4),
                    child: myDetailsContainer1(meals),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 50.0),
        height: 150.0,
        child: ListView.builder(
          itemCount: MEALS_DATA.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final Meals meals = MEALS_DATA[index];
            return _boxes(meals);
          },
        ),
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(target: LatLng(-4.0810145, 122.157141), zoom: 7),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(long, lat),
      zoom: 10,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: const LatLng(-4.0810145, 122.157141), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: const LatLng(-4.0810145, 122.157141), zoom: zoomVal)));
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: const Icon(FontAwesomeIcons.searchMinus, color: Colors.black87),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: const Icon(FontAwesomeIcons.searchPlus, color: Colors.black87),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }
}
