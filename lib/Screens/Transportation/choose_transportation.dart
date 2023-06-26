import 'package:flutter/material.dart';

class ChooseTransportation extends StatelessWidget {
  const ChooseTransportation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Transportation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Select Transportation',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            buildTransportOption(
                'Bus',
                Icons.directions_bus,
                Colors.blue,
                context,
                    (){
                  Navigator.pushNamed(context, '/ChooseSeatPage');
                }
            ),
            const SizedBox(height: 20),
            buildTransportOption(
                'Car',
                Icons.directions_car,
                Colors.orange,
                context,
                    (){
                  Navigator.pushNamed(context, '/ChooseSeatPage');
                }
            ),
            const SizedBox(height: 20),
            buildTransportOption(
                'Airplane',
                Icons.airplanemode_active,
                Colors.red,
                context,
                    (){
                  Navigator.pushNamed(context, '/ChooseSeatPage');
                }
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTransportOption(
      String title,
      IconData icon,
      Color color,
      BuildContext context,
      Function voidCallback,
      ) {
    
  }
}

