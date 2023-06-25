class PlaceListData {
  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perNight;

  PlaceListData({
    this.imagePath='',
    this.titleTxt='',
    this.subTxt='',
    this.dist=1.8,
    this.rating=4.5,
    this.reviews=80,
    this.perNight=180,
  });

  static List<PlaceListData> placeList = <PlaceListData>[
    PlaceListData(
      imagePath: 'Assets/hotel/hotel_5.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
    ),
    PlaceListData(
      imagePath: 'Assets/hotel/hotel_4.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 200,
    ),
    PlaceListData(
      imagePath: 'Assets/hotel/hotel_3.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 60,
    ),
    PlaceListData(
      imagePath: 'Assets/hotel/hotel_2.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 170,
    ),
    PlaceListData(
      imagePath: 'Assets/hotel/hotel_1.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 200,
    ),
  ];

}