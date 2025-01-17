import 'package:flutter/material.dart';
import 'views/dashboard_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVVM App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DashboardView(),
    );
  }
}
