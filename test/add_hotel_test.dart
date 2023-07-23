import 'package:flutter_test/flutter_test.dart';
import 'package:tripdash/Screens/AdminScreen/add_hotel.dart';
import 'package:tripdash/Screens/AdminScreen/add_hotel.dart';
//import 'package:tripdash/hotel.dart'; // Import the hotel class or relevant file

void main() {
  group('Hotel Management', () {
    test('Add Hotel', () {
      // Arrange
      final hotel = Hotel();
      const name = 'Grand Hotel';
      final address = '123 Main Street';

      // Act
      hotel.AdminAddHotels(name, address);

      // Assert
      expect(hotel.hotels.length, 1); // Assuming `hotels` is a list of hotels
      expect(hotel.hotels[0].name, name);
      expect(hotel.hotels[0].address, address);
    });
  });
}

class Hotel {}
