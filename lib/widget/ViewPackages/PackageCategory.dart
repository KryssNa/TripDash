import 'package:flutter/material.dart';

class PackageContainer extends StatelessWidget {
  final String name;
  final String stars;
  final String location;
  final String price;
  final String imgpath;
  final String numberofpep;


  const PackageContainer({Key? key, required this.numberofpep, required this.price, required this.location, required this.stars, required this.imgpath, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 525,
      margin:
      EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 90,
              margin: const EdgeInsets.only(
                left: 10,
              ),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: AssetImage(
                    imgpath,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 25.0, top: 25, bottom: 30, right: 5),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 5,
                        ),
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(stars)
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, top: 10, right: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 20,
                          ),
                          Text(" $location")
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.attach_money,
                                    color: Color(0xff03bdc9),
                                    size: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: price,
                                  style: TextStyle(
                                    color: Color(0xff03bdc9),
                                    fontSize: 12,
                                    fontWeight:
                                    FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: " /$numberofpep",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight:
                                    FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
