import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearme/src/model/custome_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearme/src/provider/favourite_places_provider.dart';
import 'package:nearme/src/provider/saved_places_provider.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * 0.45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(c.imageUrl),
                      fit: BoxFit.cover,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 34,
                    right: 16,
                    left: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                                  color:
                                      isFavourite ? Colors.red : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
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
                        ],
                      ),
                      SizedBox(
                        height: h * 0.24,
                      ),
                      Container(
                        width: w * 0.2,
                        height: h * 0.022,
                        decoration: ShapeDecoration(
                          color: const Color(0x66D9D9D9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Text(
                          'Vadodara',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.035,
                      ),
                      Text(
                        c.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: h * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.directions, size: w * 0.075),
                        label: const Text('Directions'),
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(
                            Color.fromRGBO(54, 122, 255, 1),
                          ),
                          textStyle: MaterialStatePropertyAll(TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: w * 0.055,
                          )),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                        ),
                      ),
                      SizedBox(width: w * 0.04),
                      TextButton.icon(
                        onPressed: () {
                          final wasAdded = ref
                              .read(savedPlaceProvider.notifier)
                              .toggleSaveStatus(c);
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: const Color(0xFFE3F2FD),
                            content: Text(
                              wasAdded ? 'Place Saved' : 'Place Unsaved.',
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            duration: const Duration(seconds: 3),
                          ));
                        },
                        icon: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_border,
                            size: w * 0.075),
                        label: Text(isSaved ? 'Saved' : 'Save'),
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(color: Colors.grey)),
                          ),
                          backgroundColor: MaterialStatePropertyAll(isSaved
                              ? const Color.fromRGBO(54, 122, 255, 1)
                              : Colors.white),
                          textStyle: MaterialStatePropertyAll(TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: w * 0.055,
                          )),
                          foregroundColor: MaterialStatePropertyAll(
                            isSaved
                                ? Colors.white
                                : const Color.fromRGBO(54, 122, 255, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  Container(
                    color: Colors.grey,
                    height: 100,
                    width: double.infinity,
                  ),
                  SizedBox(height: h * 0.02),
                  Text(
                    c.info,
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    height: h * 0.03,
                  ),
                  Row(
                    children: [
                      Text(
                        c.rating.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 3),
                      starIcon(),
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
                          Text(
                            c.rating.toString(),
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // const SizedBox(height: 3),
                          starIcon(),
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

  Widget starIcon() {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          const Icon(
            Icons.star,
            color: Color(0xFFFFCB45),
          ),
      ],
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
