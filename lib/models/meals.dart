class Meals {
  String name;
  String id;
  String deis;
  String image;
  String numberOrders;
  double lat;
  double long;
  double rating;

  Meals(this.name, this.id, this.deis, this.image, this.numberOrders, this.lat,
      this.long, this.rating);
}

List<Meals> MEALS_DATA = [
  Meals(
    "Taman Nasional Wakatobi",
    "1",
    "Cagar alam pulau dengan terumbu karang dan kehidupan laut yang dilindungi serta situs menyelam yang terkenal dengan ikan pari dan paus sperma.",
    "assets/images/wakatobi.jpeg",
    "152",
    -5.5659891,
    123.786406,
    5,
  ),
  Meals(
    "Danau Biru",
    "2",
    "Danau Biru Kolaka pasti membuat Anda berpaling dan tidak mau ke mana-mana lagi. Danau ini masuk dalam wilayah Desa Walasiho, Kecamatan Wawo",
    "assets/images/danau_biru.jpeg",
    "152",
    -3.7271598,
    121.0900477,
    4.5,
  ),
  Meals(
    "Desa Labengki",
    "3",
    "destinasi yang berada di desa labengki kecamatan lasolo kepulauan kabupaten konawe utara.objek wisata ini banyak diminati wisatawan",
    "assets/images/desa_labengki.jpeg",
    "152",
    -3.4500618,
    122.4093213,
    4.5,
  ),
  Meals(
    "Pantai Nirwana",
    "4",
    "pantai yang terkenal akan keindahannya di Indonesia adalah Pantai Nirwana. Letaknya berada di Baubau Sulawesi Tenggara",
    "assets/images/pantai_nirwana.jpeg",
    "152",
    -5.5202904,
    122.545166,
    4.5,
  ),
];
