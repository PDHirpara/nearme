import 'package:flutter/material.dart';
import '../model/city_banner.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundColor: const Color(0xffEAEDF4),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                )),
          ),
          const Spacer(),
          const SizedBox(
              height: 70,
              width: 50,
              child:
                  Image(image: AssetImage('Assets/logo/Icon/nearme_logo.png'))),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundColor: const Color(0xffEAEDF4),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CityBanner(
              image: Image.network(imageUrl),
              borderRadius: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.directions,
                      color: Color(0xff407BFF),
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Color(0xff407BFF),
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.save,
                      color: Color(0xff407BFF),
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Color(0xff407BFF),
                      size: 30,
                    )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: Text(
                title,
                style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
