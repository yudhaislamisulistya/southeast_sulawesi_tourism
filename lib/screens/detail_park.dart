import 'package:bella_app/constants.dart';
import 'package:bella_app/screens/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPark extends StatelessWidget {
  const DetailPark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              alignment: Alignment.topCenter,
              height: size.height - 300,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/wakatobi.jpeg'),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height / 2.2,
              width: size.width,
              decoration: BoxDecoration(
                color: colorAccent,
                borderRadius: BorderRadius.circular(34),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        height: 5,
                        width: 32 * 1.5,
                        decoration: BoxDecoration(
                          gradient: colorGradient,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    const ProductNameAndPrice(),
                    const SizedBox(height: 16),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              child: Text(
                            "4.5",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )),
                          SizedBox(
                            width: 8,
                          ),
                          RatingBar.builder(
                            initialRating: 4.5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            updateOnDrag: false,
                            ignoreGestures: true,
                            itemSize: 35,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 10,
                            ),
                            onRatingUpdate: (double value) {},
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              child: Text(
                            "120",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Spacing(),
                    Row(
                      children: const [
                        TabTitle(label: 'Informasi', selected: true),
                      ],
                    ),
                    const Spacing(),
                    Text(
                      'Cagar alam pulau dengan terumbu karang dan kehidupan laut yang dilindungi serta situs menyelam yang terkenal dengan ikan pari dan paus sperma.',
                      style: bodyText.copyWith(color: Colors.white),
                    ),
                    const Spacing(),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(colorPrimary),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                            minimumSize: MaterialStateProperty.all(
                                Size(size.width / 1.4, 37))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Maps(),
                            ),
                          );
                        },
                        child: Text(
                          'Lihat Map',
                          style: h3.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TabTitle extends StatelessWidget {
  final String label;
  final bool selected;
  const TabTitle({
    Key? key,
    required this.label,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            label,
            style: text.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 4,
          ),
          if (selected)
            Container(
              width: 21,
              height: 2,
              decoration: const BoxDecoration(color: colorPrimary),
            )
        ])
      ],
    );
  }
}

class Spacing extends StatelessWidget {
  const Spacing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}

class RectButtonSelected extends StatelessWidget {
  final String label;
  const RectButtonSelected({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9), gradient: colorGradient),
      child: Center(
          child: Text(
        label,
        style: text,
      )),
    );
  }
}

class RectButton extends StatelessWidget {
  final String label;
  const RectButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: colorPrimary)),
      child: Center(
          child: Text(
        label,
        style: text.copyWith(color: Colors.white),
      )),
    );
  }
}

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Pulau Wakatobi',
              style: h1Light.copyWith(color: Colors.white),
            ),
          ),
          Text(
            'Wakatobi',
            style: h1Light.copyWith(
                color: colorPrimary, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
