import 'package:bella_app/constants.dart';
import 'package:bella_app/screens/detail_park.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: colorAccent),
                    ),
                    Row(
                      children: [
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
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Parawisata Sultra",
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: colorAccent,
                      letterSpacing: 2.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: colorPrimary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      icon: Icon(
                        Icons.search,
                        color: colorPrimary,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 30,
                  child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                      controller: _tabController,
                      labelPadding: EdgeInsets.only(left: 14, right: 14),
                      indicatorPadding: EdgeInsets.only(left: 14, right: 14),
                      isScrollable: true,
                      labelColor: colorPrimary,
                      unselectedLabelColor: Colors.grey,
                      indicator:
                          CircleTabIndicator(color: colorPrimary, radius: 2.0),
                      tabs: [
                        Tab(
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Semua",
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Wisata Alam",
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Wisata Budaya",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.maxFinite,
                  height: 325,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildCardWisata("Pulau Wakatobi", "Wakatobi",
                              "assets/images/wakatobi.jpeg", context),
                          _buildCardWisata("Danai Biru", "Kolaka",
                              "assets/images/danau_biru.jpeg", context),
                          _buildCardWisata("Pantai Nirwana", "Bau Bau",
                              "assets/images/pantai_nirwana.jpeg", context),
                        ],
                      ),
                      _buildCardWisata("Pulau Wakatobi", "Wakatobi",
                          "assets/images/wakatobi.jpeg", context),
                      _buildCardWisata("Pulau Wakatobi", "Wakatobi",
                          "assets/images/wakatobi.jpeg", context),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                // make recomendation
                Row(
                  children: [
                    Text(
                      "Rekomendasi",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: colorAccent),
                    ),
                    Spacer(),
                    Text(
                      "Lihat Semua",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: colorPrimary),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.maxFinite,
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCardWisataRekomendasi("Desa Labengki", "2 Jam",
                          "assets/images/desa_labengki.jpeg"),
                      _buildCardWisataRekomendasi("Pantai Toronipa", "4 Jam",
                          "assets/images/pantai_toronipa.jpeg"),
                      _buildCardWisataRekomendasi("Pulau Hoga", "3 Jam",
                          "assets/images/pulau_hoga.jpeg"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container _buildCardWisataRekomendasi(title, time, image) {
  return Container(
    width: 150,
    height: 140,
    margin: EdgeInsets.only(right: 10.0),
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
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorAccent,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          time,
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

GestureDetector _buildCardWisata(title, location, images, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailPark()));
    },
    child: Container(
      margin: EdgeInsets.only(right: 20),
      width: 225,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
            images,
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
                borderRadius: BorderRadius.only(
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
                      style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      location,
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
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

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
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
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
