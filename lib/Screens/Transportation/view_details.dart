import 'package:flutter/material.dart';
import 'package:tripdash/Screens/Transportation/choose_transportation.dart';
import 'package:tripdash/constant/colors.dart';
import 'package:tripdash/constant/fonts.dart';
import 'Widgets/custom_button.dart';
import 'Widgets/interest_item.dart';
import 'Widgets/photo_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image_destination1.png'))),
      );
    }

    Widget customShadow() {
      return Container(
          width: double.infinity,
          height: 214,
          margin: const EdgeInsets.only(top: 236),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                ConstColors.kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.95)
              ])));
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30, left: 24, right: 24),
        child: Column(children: [
          Container(
            width: 108,
            height: 24,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/icon_emblem.png',
              ),
            )),
          ),

          // NOTE: title
          Container(
            margin: const EdgeInsets.only(top: 256),
            child: Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lake Tilicho',
                      style: TextStyle(
                          fontSize: 24, fontWeight: ConstFonts.semiBold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Manang',
                      style:
                          TextStyle(fontSize: 16, fontWeight: ConstFonts.light),
                    )
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
                        image: AssetImage('assets/icon_star.png'),
                      ),
                    ),
                  ),
                  Text(
                    '4.8',
                    style: TextStyle(
                      color: ConstColors.kWhiteColor,
                      fontWeight: ConstFonts.medium,
                    ),
                  )
                ],
              ),
            ]),
          ),

          //NOTE: Descripstion
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            decoration: BoxDecoration(
                color: ConstColors.kWhiteColor,
                borderRadius: BorderRadius.circular(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style:
                      TextStyle(fontSize: 16, fontWeight: ConstFonts.semiBold),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'Lorem etiam tempor orci magna. Nisl amet, adipiscing elit ut integer. Ut enim sit aliquam diam condimentum. Egestas eget nulla pretium eget augue. Nisl, eget adipiscing eget ultricies integer. ',
                  style: TextStyle(height: 2),
                ),

                //NOTE: Photos
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Photos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: ConstFonts.semiBold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Row(
                  children: [
                    PhotoItem(
                      imageUrl: 'assets/image_photo1.png',
                    ),
                    PhotoItem(
                      imageUrl: 'assets/image_photo2.png',
                    ),
                    PhotoItem(
                      imageUrl: 'assets/image_photo3.png',
                    ),
                  ],
                ),

                //Note: Interest
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Interests',
                  style: TextStyle(
                    color: ConstColors.kBlackColor,
                    fontSize: 16,
                    fontWeight: ConstFonts.semiBold,
                  ),
                ),
                const SizedBox(height: 6),
                const Row(
                  children: [
                    InterestItem(
                      text: 'Kids Park',
                    ),
                    InterestItem(
                      text: 'Honor Bridge',
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    InterestItem(
                      text: 'City Museum',
                    ),
                    InterestItem(
                      text: 'Central Mall',
                    )
                  ],
                ),
              ],
            ),
          ),

          //NOTE: PRICE & BOOK BUTTON
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                //NOTE: PRICE
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rs. 15000',
                        style: TextStyle(
                            color: ConstColors.kBlackColor,
                            fontSize: 18,
                            fontWeight: ConstFonts.medium),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'per person',
                        style: TextStyle(
                            color: ConstColors.kGreyColor,
                            fontWeight: ConstFonts.light),
                      ),
                    ],
                  ),
                ),

                //NOTE: BOOK BUTTON
                CustomButton(
                  title: 'Book Now',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseTransportation(),
                        ));
                  },
                  width: 170,
                )
              ],
            ),
          )
        ]),
      );
    }

    return Scaffold(
      backgroundColor: ConstColors.kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [backgroundImage(), customShadow(), content()],
        ),
      ),
    );
  }
}
