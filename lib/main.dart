import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'ui/dashboard-page.dart';

void main() {
  //inisialisasi penggunaan Riverpod menggunakan ProviderScope
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circle Creative',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //rute menuju halaman Dashboard
      home: const DashboardPage(),
    );
  }
}

