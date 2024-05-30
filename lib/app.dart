import 'package:assessment/home.dart';
import 'package:assessment/utils/theme.dart';
import 'package:flutter/material.dart';

class SpecnoOffices extends StatefulWidget {
  const SpecnoOffices({super.key});

  @override
  State<SpecnoOffices> createState() => _SpecnoOfficesState();
}

class _SpecnoOfficesState extends State<SpecnoOffices> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Specno Offices',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const HomeScreen(),
    );
  }
}
