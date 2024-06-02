import 'package:assessment/utils/router.dart';
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
    return MaterialApp.router(
      title: 'Specno Offices',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routerConfig: router,
    );
  }
}
