import 'package:flutter_test/flutter_test.dart';
//import 'package:tripdash/event_manager.dart';

void main() {
  group('Event Manager', () {
    late EventManager eventManager;

    setUp(() {
      eventManager = EventManager();
    });

    test('Adding a new event should increase the events list', () {
      // Arrange
      final event = Event(title: 'Test Event', date: DateTime.now());

      // Act
      eventManager.addEvent(event);

      // Assert
      expect(eventManager.events.length, 1);
    });

    test('Adding multiple events should increase the events list', () {
      // Arrange
      final event1 = Event(title: 'Event 1', date: DateTime.now());
      final event2 = Event(title: 'Event 2', date: DateTime.now());

      // Act
      eventManager.addEvent(event1);
      eventManager.addEvent(event2);

      // Assert
      expect(eventManager.events.length, 2);
    });
  });
}

class Event {
  final String title;
  final DateTime date;

  Event({required this.title, required this.date});
}

class EventManager {
  final List<Event> events = [];

  void addEvent(Event event) {
    events.add(event);
  }
}
