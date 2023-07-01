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
      width: 525,
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
            
          ],
        ),
      ),
    );
  }
}
