import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nearme/src/model/custome_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearme/src/provider/favourite_places_provider.dart';
import 'package:nearme/src/provider/saved_places_provider.dart';
import 'package:get/get.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.c});

  final CustomContainer c;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    final favouritePlaces = ref.watch(favouritePlaceProvider);
    final isFavourite = favouritePlaces.contains(c);
    final savedPlaces = ref.watch(savedPlaceProvider);
    final isSaved = savedPlaces.contains(c);
    var datetime = DateTime.now();
    print("dhsbhdb${datetime}");
    RxDouble totalrating = c.rating.obs;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h * 0.45,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(c.imageUrl),
                  fit: BoxFit.fill,
                ),
                color: Colors.grey,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 25,
                    offset: Offset(4, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 33),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            final wasAdded = ref
                                .read(favouritePlaceProvider.notifier)
                                .toggleFavouriteStatus(c);
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color(0xFFE3F2FD),
                                content: Text(
                                  wasAdded
                                      ? 'Place added as Favourite'
                                      : 'Place removed.',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          },
                          child: Container(
                            width: w * 0.1,
                            height: h * 0.05,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9).withOpacity(0.8),
                              shape: const CircleBorder(),
                            ),
                            child: Center(
                              child: Icon(
                                isFavourite
                                    ? CupertinoIcons.heart_fill
                                    : CupertinoIcons.heart,
                                size: 27,
                                color: isFavourite ? Colors.red : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: w * 0.1,
                            height: h * 0.05,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9).withOpacity(0.8),
                              shape: const CircleBorder(),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.share,
                                size: 27,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 3),
                        child: Text(
                          "${c.city}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 3),
                    child: Text(
                      c.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.02),
                  Text(
                    c.info,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: h * 0.02),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          image: NetworkImage("https://encrypted-tbn0.gstatic"
                              ".com/images?q=tbn:ANd9GcS7ZQ3fDEMe0XJ938vpL7vo_PbmjgGQ7NxxsfQcS9kTbf6HTt7L55ez3LseytNmSwr5x3M&usqp=CAU"),
                          fit: BoxFit.fill),
                    ),
                    height: 100,
                    width: double.infinity,
                  ),
                  Divider(
                    height: h * 0.03,
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Text(
                          totalrating.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 3),
                      RatingBar.builder(
                        initialRating: totalrating.value,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          totalrating.value = rating;
                          print("dshvbfhjvb");
                          print(rating);
                        },
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        '(45K)',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.01),
                  Row(
                    children: [
                      const Text(
                        'Status :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        c.status,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 30),
                      const Text(
                        '9:00 am to 5pm',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Color.fromRGBO(54, 122, 255, 1),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Address :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: w * 0.005),
                      Expanded(
                        child: Text(
                          c.address,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: h * 0.03,
                  ),
                  const Text(
                    'Review summary',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Obx(
                            () => Text(
                              totalrating.value.toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // const SizedBox(height: 3),

                          const SizedBox(height: 5),
                          const Text(
                            '(45K)',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: w * 0.45,
                            child: LinearProgressIndicator(
                              value: 4 / 5,
                              color: const Color(0xFFFFCB45),
                              borderRadius: BorderRadius.circular(20),
                              minHeight: h * 0.01,
                            ),
                          ),
                          SizedBox(height: h * 0.01),
                          SizedBox(
                            width: w * 0.45,
                            child: LinearProgressIndicator(
                              value: 3.5 / 5,
                              color: const Color(0xFFFFCB45),
                              borderRadius: BorderRadius.circular(20),
                              minHeight: h * 0.01,
                            ),
                          ),
                          SizedBox(height: h * 0.01),
                          SizedBox(
                            width: w * 0.45,
                            child: LinearProgressIndicator(
                              value: 3 / 5,
                              color: const Color(0xFFFFCB45),
                              borderRadius: BorderRadius.circular(20),
                              minHeight: h * 0.01,
                            ),
                          ),
                          SizedBox(height: h * 0.01),
                          SizedBox(
                            width: w * 0.45,
                            child: LinearProgressIndicator(
                              value: 2 / 5,
                              color: const Color(0xFFFFCB45),
                              borderRadius: BorderRadius.circular(20),
                              minHeight: h * 0.01,
                            ),
                          ),
                          SizedBox(height: h * 0.01),
                          SizedBox(
                            width: w * 0.45,
                            child: LinearProgressIndicator(
                              value: 1 / 5,
                              color: const Color(0xFFFFCB45),
                              borderRadius: BorderRadius.circular(20),
                              minHeight: h * 0.01,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ratingBar('Royal', 4.5),
                        ratingBar('Service', 4.0),
                        ratingBar('Location', 4.8)
                      ]),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ratingBar(String label, double rating) {
    return Column(children: [
      Text(label),
      Text(rating.toString()),
      SizedBox(
        width: 50,
        child: LinearProgressIndicator(
          value: rating / 5,
          color: const Color(0xFFFFCB45),
          borderRadius: BorderRadius.circular(20),
        ),
      )
    ]);
  }
}
