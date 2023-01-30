// ignore_for_file: prefer_interpolation_to_compose_strings, depend_on_referenced_packages, avoid_unnecessary_containers

import 'package:bella_app/constants.dart';
import 'package:bella_app/screens/all_destination.dart';
import 'package:bella_app/screens/detail_park.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

GestureDetector _buildCardWisata(title, lokasi, informasi, review, rating, image, longitude, latitude, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPark(title, lokasi, informasi, review, rating, image, longitude, latitude)));
    },
    child: Container(
      margin: const EdgeInsets.only(right: 20),
      width: 225,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            "${siteUrl}assets/img/wisata/" + image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      lokasi,
                      style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildCardWisataRekomendasi(title, lokasi, informasi, review, rating, image, longitude, latitude, context) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPark(title, lokasi, informasi, review, rating, image, longitude, latitude)));
    },
    child: Container(
      width: 150,
      height: 140,
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("${siteUrl}assets/img/wisata/" + image),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: colorAccent,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            lokasi,
            style: const TextStyle(
              fontSize: 10.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius}) : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late List dataWisata = [];
  late List dataWisataAlam = [];
  late List dataWisataBahari = [];
  late List dataWisataBudaya = [];
  late List dataWisataLainnya = [];

  late int total = 0;
  late int totalAlam = 0;
  late int totalBahari = 0;
  late int totalBudaya = 0;
  late int totalLainnya = 0;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Explore",
                      style: TextStyle(fontWeight: FontWeight.bold, color: colorAccent),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.pin_drop,
                          color: colorPrimary,
                          size: 16,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Kendari, ID"),
                        SizedBox(
                          width: 2.0,
                        ),
                        Icon(
                          Icons.arrow_downward,
                          color: colorPrimary,
                          size: 10,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Parawisata Sultra",
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: colorAccent, letterSpacing: 2.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 10.0),
                //   decoration: BoxDecoration(
                //     color: colorPrimary.withOpacity(0.1),
                //     borderRadius: BorderRadius.circular(20.0),
                //   ),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       border: InputBorder.none,
                //       hintText: "Search",
                //       hintStyle: TextStyle(
                //         color: Colors.grey,
                //       ),
                //       icon: Icon(
                //         Icons.search,
                //         color: colorPrimary,
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 30,
                  child: DefaultTabController(
                    length: 5,
                    child: TabBar(
                      controller: tabController,
                      labelPadding: const EdgeInsets.only(left: 14, right: 14),
                      indicatorPadding: const EdgeInsets.only(left: 14, right: 14),
                      isScrollable: true,
                      labelColor: colorPrimary,
                      unselectedLabelColor: Colors.grey,
                      indicator: CircleTabIndicator(color: colorPrimary, radius: 2.0),
                      tabs: [
                        Tab(
                          child: Container(
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Semua",
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Wisata Alam",
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Wisata Bahari",
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Wisata Budaya",
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Lainnya",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 325,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      total == 0
                          ? const Center(
                              child: Text("Data Kosong"),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: total,
                              itemBuilder: (context, index) {
                                return _buildCardWisata(dataWisata[index]['nama'], dataWisata[index]['lokasi'], dataWisata[index]['informasi'], dataWisata[index]['review'], dataWisata[index]['rating'], dataWisata[index]['file'], dataWisata[index]['longitude'], dataWisata[index]['latitude'], context);
                              },
                            ),
                      totalAlam == 0
                          ? const Center(child: Text("Data Kosong"))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: totalAlam,
                              itemBuilder: (context, index) {
                                return _buildCardWisata(dataWisataAlam[index]['nama'], dataWisataAlam[index]['lokasi'], dataWisataAlam[index]['informasi'], dataWisataAlam[index]['review'], dataWisataAlam[index]['rating'], dataWisataAlam[index]['file'], dataWisataAlam[index]['longitude'], dataWisataAlam[index]['latitude'], context);
                              },
                            ),
                      totalBahari == 0
                          ? const Center(child: Text("Data Kosong"))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: totalBahari,
                              itemBuilder: (context, index) {
                                return _buildCardWisata(dataWisataBahari[index]['nama'], dataWisataBahari[index]['lokasi'], dataWisataBahari[index]['informasi'], dataWisataBahari[index]['review'], dataWisataBahari[index]['rating'], dataWisataBahari[index]['file'], dataWisataBahari[index]['longitude'], dataWisataBahari[index]['latitude'], context);
                              },
                            ),
                      totalBudaya == 0
                          ? const Center(child: Text("Data Kosong"))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: totalBudaya,
                              itemBuilder: (context, index) {
                                return _buildCardWisata(dataWisataBudaya[index]['nama'], dataWisataBudaya[index]['lokasi'], dataWisataBudaya[index]['informasi'], dataWisataBudaya[index]['review'], dataWisataBudaya[index]['rating'], dataWisataBudaya[index]['file'], dataWisataBudaya[index]['longitude'], dataWisataBudaya[index]['latitude'], context);
                              },
                            ),
                      totalLainnya == 0
                          ? const Center(child: Text("Data Kosong"))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: totalLainnya,
                              itemBuilder: (context, index) {
                                return _buildCardWisata(dataWisataLainnya[index]['nama'], dataWisataLainnya[index]['lokasi'], dataWisataLainnya[index]['informasi'], dataWisataLainnya[index]['review'], dataWisataLainnya[index]['rating'], dataWisataLainnya[index]['file'], dataWisataLainnya[index]['longitude'], dataWisataLainnya[index]['latitude'], context);
                              },
                            ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // make recomendation
                Row(
                  children: [
                    const Text(
                      "Rekomendasi",
                      style: TextStyle(fontWeight: FontWeight.bold, color: colorAccent),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllDestionation(),
                          ),
                        );
                      },
                      child: const Text(
                        "Lihat Semua",
                        style: TextStyle(fontWeight: FontWeight.bold, color: colorPrimary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 160,
                  child: total == 0
                      ? const Center(
                          child: Text("Data Kosong"),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: total,
                          itemBuilder: (context, index) {
                            return _buildCardWisataRekomendasi(
                              dataWisata[index]['nama'],
                              dataWisata[index]['lokasi'],
                              dataWisata[index]['informasi'],
                              dataWisata[index]['review'],
                              dataWisata[index]['rating'],
                              dataWisata[index]['file'],
                              dataWisata[index]['longitude'],
                              dataWisata[index]['latitude'],
                              context,
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getDataWisata() async {
    var dio = Dio();
    var response = await dio.get("${siteUrl}apiv1/wisata");
    setState(() {
      dataWisata = response.data['data'];
      total = response.data['total'];
    });
  }

  void getDataWisataJenis(jenis) async {
    var dio = Dio();
    var response = await dio.get("${siteUrl}apiv1/wisata/jenis/" + jenis);
    setState(() {
      if (jenis == "Wisata Alam") {
        dataWisataAlam = response.data['data'];
        totalAlam = response.data['total'];
      } else if (jenis == "Wisata Bahari") {
        dataWisataBahari = response.data['data'];
        totalBahari = response.data['total'];
      } else if (jenis == "Wisata Budaya") {
        dataWisataBudaya = response.data['data'];
        totalBudaya = response.data['total'];
      } else if (jenis == "Wisata Lainnya") {
        dataWisataLainnya = response.data['data'];
        totalLainnya = response.data['total'];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDataWisata();
    getDataWisataJenis("Wisata Alam");
    getDataWisataJenis("Wisata Bahari");
    getDataWisataJenis("Wisata Budaya");
    getDataWisataJenis("Wisata Lainnya");
  }
}
