import 'package:flutter/material.dart';

class PackageContainer extends StatelessWidget {
  final String category;
  final String date;
  final String location;
  final String description;
  final String imageUrl;
  final String title;


  const PackageContainer({Key? key, required this.title, required this.description, required this.location, required this.date, required this.imageUrl, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 405,
      margin:
      const EdgeInsets.only(left: 15, right: 15, top: 10),
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
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                       top: 25, bottom: 10,),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                        ),
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Date : ',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              date,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Text(
                              description,
                              style: const TextStyle(
                                      color: Color(0xff03bdc9),
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight.w500,
                                    ),
                            ),
                          ],
                        ),
                      ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 10, right: 5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 20,
                          ),
                          Text(" $location")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    description,
                                    style: const TextStyle(
                                      color: Color(0xff03bdc9),
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    category,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight:
                                      FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    
                  ],
                )
              ],
            )
        ),
      );
  }
}
