import 'package:flutter/material.dart';
import 'package:tripdash/model/hotel_model.dart';
import 'hotel_theme.dart';

class RatingWidget extends StatelessWidget {
  final Icon full;
  final Icon half;
  final Icon empty;

  const RatingWidget({super.key,
    required this.full,
    required this.half,
    required this.empty,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        full,
        half,
        empty,
      ],
    );
  }
}

class HotelListView extends StatelessWidget {
  const HotelListView({
    Key? key,
    this.hotelData,
    this.callback,
    this.animation,
    this.animationController,
  }) : super(key: key);

  final HotelModel? hotelData;
  final Function? callback;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 50 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(4, 4),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          // AspectRatio(
                          //   aspectRatio: 2,
                          //   child: Image.asset(
                          //     hotelData!.imagePath,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          AspectRatio(
                            aspectRatio: 2,
                            child: Image.network(
                              hotelData!.imageUrl.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: HotelTheme.buildLightTheme().colorScheme.background,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          hotelData!.hotelName.toString(),
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              hotelData!.description.toString(),
                                              style: TextStyle(
                                                color: Colors.grey.withOpacity(0.8),
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Icon(
                                              Icons.location_on,
                                              size: 16,
                                              color: HotelTheme.buildLightTheme().primaryColor,
                                            ),
                                            Expanded(
                                              child: Text(
                                                // '${hotelData!..toStringAsFixed(1)} km to city',
                                                '60km for Kathmandu',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.withOpacity(0.8),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4),
                                          child: Row(
                                            children: <Widget>[
                                              RatingWidget(
                                                full: Icon(
                                                  Icons.star_rate_rounded,
                                                  color: HotelTheme.buildLightTheme().primaryColor,
                                                ),
                                                half: Icon(
                                                  Icons.star_half_rounded,
                                                  color: HotelTheme.buildLightTheme().primaryColor,
                                                ),
                                                empty: Icon(
                                                  Icons.star_border_rounded,
                                                  color: HotelTheme.buildLightTheme().primaryColor,
                                                ),
                                              ),
                                              Text(
                                                // '${hotelData!.reviews} Reviews',
                                                'Reviews',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.withOpacity(0.8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16, top: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$${hotelData!.price.toString()}',
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '/per night',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.withOpacity(0.8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Material(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite_border,
                              color: HotelTheme.buildLightTheme().primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}