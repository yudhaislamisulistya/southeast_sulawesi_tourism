// ignore_for_file: prefer_interpolation_to_compose_strings, depend_on_referenced_packages

import 'package:bella_app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AllDestionation extends StatefulWidget {
  const AllDestionation({Key? key}) : super(key: key);

  @override
  State<AllDestionation> createState() => _AllDestionationState();
}

class _AllDestionationState extends State<AllDestionation> {
  late List dataWisata = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: dataWisata.isEmpty
            ? const Center(
                child: Text("Data Kosong"),
              )
            : ListView.builder(
                itemCount: dataWisata.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 170.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: 120.0,
                                    child: Text(
                                      dataWisata[index]['nama'],
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        dataWisata[index]['rating'],
                                        style: const TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      RatingBar.builder(
                                        initialRating: double.parse(dataWisata[index]['rating']),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        updateOnDrag: false,
                                        ignoreGestures: true,
                                        itemSize: 15,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                        onRatingUpdate: (double value) {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                dataWisata[index]['informasi'],
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      color: colorPrimary,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      dataWisata[index]['lokasi'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 15.0,
                        bottom: 15.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width: 110.0,
                            image: NetworkImage("${siteUrl}assets/img/wisata/" + dataWisata[index]['file']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }

  void getDataWisata() async {
    var dio = Dio();
    var response = await dio.get("${siteUrl}apiv1/wisata");
    var data = response.data['data'];
    if (mounted) {
      setState(() {
        dataWisata = data;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDataWisata();
  }
}
