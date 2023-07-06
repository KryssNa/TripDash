import 'package:flutter/material.dart';
import 'package:tripdash/Screens/TransportationScreen/view_details.dart';
import 'package:tripdash/constant/colors.dart';
import 'package:tripdash/constant/fonts.dart';

class DestinationTile extends StatelessWidget {
  final String name;
  final String city;
  final String imageUrl;
  final double rating;

  const DestinationTile({
    Key? key,
    required this.name,
    required this.city,
    required this.imageUrl,
    this.rating = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailPage()),
        );
      },
      child: Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ConstColors.kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(imageUrl))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: ConstFonts.blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: ConstFonts.medium,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(city, style: ConstFonts.greyTextStyle.copyWith(fontWeight: ConstFonts.light))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 2),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('Assets/icons/icon_star.png'),
                      ),
                    ),
                  ),
                  Text(
                    rating.toString(),
                    style: ConstFonts.blackTextStyle.copyWith(
                      fontWeight: ConstFonts.medium,
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
