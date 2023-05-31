import 'package:flutter/material.dart';

// multiprovider

import 'package:provider/provider.dart';
import 'package:tripdash/ViewModel/auth_viewmodel.dart';

class multiProvider extends StatelessWidget {
  const multiProvider({Key? key,  required this.child}) : super(key: key);
  final MaterialApp child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),

        ],
      child:child,
    );
  }
}