import 'package:flutter/material.dart';
import 'package:tripdash/model/place_model.dart';

import 'place_theme.dart';

class RatingWidget extends StatelessWidget {
  final Icon full;
  final Icon half;
  final Icon empty;

  const RatingWidget({
    Key? key,
    required this.full,
    required this.half,
    required this.empty,
  }) : super(key: key);

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

class PlaceListView extends StatefulWidget {
  const PlaceListView({
    Key? key,
    this.placeData,
    this.callback,
    this.animation,
    this.animationController,
  }) : super(key: key);

  final PlaceModel? placeData;
  final Function? callback;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  _PlaceListViewState createState() => _PlaceListViewState();
}

class _PlaceListViewState extends State<PlaceListView> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (context, child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 50 * (1.0 - widget.animation!.value), 0.0),
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
                          AspectRatio(
                            aspectRatio: 2,
                            child: Image.network(
                              widget.placeData!.imageUrl.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: PlaceTheme.buildLightTheme().colorScheme.background,
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
                                          widget.placeData!.placeName.toString(),
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
                                              widget.placeData!.description.toString(),
                                              style: TextStyle(
                                                color: Colors.grey.withOpacity(0.8),
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Icon(
                                              Icons.location_on,
                                              size: 16,
                                              color: PlaceTheme.buildLightTheme().primaryColor,
                                            ),
                                            Expanded(
                                              child: Text(
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
                                                  color: PlaceTheme.buildLightTheme().primaryColor,
                                                ),
                                                half: Icon(
                                                  Icons.star_half_rounded,
                                                  color: PlaceTheme.buildLightTheme().primaryColor,
                                                ),
                                                empty: Icon(
                                                  Icons.star_border_rounded,
                                                  color: PlaceTheme.buildLightTheme().primaryColor,
                                                ),
                                              ),
                                              Text(
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
                                        '\$${widget.placeData!.price.toString()}',
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
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isClicked = !_isClicked; // Toggle the state
                                });
                              },
                              child: Icon(
                                Icons.favorite_border,
                                color: _isClicked
                                    ? Colors.red // Change the color when it's clicked
                                    : PlaceTheme.buildLightTheme().splashColor,
                              ),
                            ),
                          ),
                        ),
                      )
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

