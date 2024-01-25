import 'package:flutter/material.dart';
import 'package:nearme/src/views/deatil_page.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;

  const CustomContainer(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DetailPage(title: title, imageUrl: imageUrl)));
      },
      child: Container(
        height: h * 0.35,
        width: w * 0.5,
        margin: const EdgeInsets.only(left: 8.0, top: 8),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey.shade50),
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade100,
          boxShadow:  const [BoxShadow(color: Colors.white24)]
        ),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            const SizedBox(height: 3,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(width: 1,),
                                  Text(
                                    '($rating)',
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              const Text(
                                'Open',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
              ),)
          ],
        ),
      ),
    );
  }
}