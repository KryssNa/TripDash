import 'package:flutter/material.dart';

class PackagaeGestureDetector extends StatelessWidget {
  final String name;
  final String location;
  final String price;
  final String people;
  final String rating;
  final String imageUrl;


  const PackagaeGestureDetector({Key? key, required this.name, required this.location, required this.people, required this.price, required this.rating, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: SizedBox(
        width: 205,
        height: 250,
        child: Stack(
          // alignment: Alignment.center,
          fit: StackFit.expand,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: <Widget>[
            Positioned(
              top: 0,
              // bottom: 250,
              child: Container(
                height: 150,
                width: 200,
                foregroundDecoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(25),
                  image: DecorationImage(
                    image: NetworkImage(
                      imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // top: 120,
              left: 11,
              bottom: 20,
              child: Container(
                height: 105,
                width: 180,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius:
                  BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "$name   ",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const WidgetSpan(
                            child: Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ),
                          TextSpan(
                            text: rating,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.place,
                              color: Colors.green,
                              size: 18,
                            ),
                          ),
                          TextSpan(
                            text: location,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.attach_money,
                              color: Color(0xff03bdc9),
                              size: 18,
                            ),
                          ),
                          TextSpan(
                            text: price,
                            style: const TextStyle(
                              color: Color(0xff03bdc9),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          TextSpan(
                            text: " /$people",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const WidgetSpan(
                              child: Icon(Icons.favorite,
                                color: Color(0xff056e73),
                                size: 20,)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ), //Container

            //container for text, location and price and rating to be placed on bottom of the image
          ],
        ),
      ),
    );
  }
}
