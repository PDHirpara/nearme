class Model {
  Model({
    required this.title,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.info,
    // required this.openTime,
    // required this.closeTime,
    required this.address,
    required this.ratingStar,
    required this.reviewsCount,
    required this.service,
  });
  final String title;
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final String info;
  // final DateTime openTime;
  // final DateTime closeTime;
  final String address;
  final double ratingStar;
  final int reviewsCount;
  final Service service;
}

enum Service {
  restaurant,
  hotel,
  hospital,
  famousPlace,
}
