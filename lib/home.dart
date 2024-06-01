import 'package:assessment/widgets/expansion_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SizedBox(
          height: 64,
          width: 64,
          child: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            backgroundColor: const Color(0xFF0D4477),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        appBar: AppBar(
          titleSpacing: 12.5,
          centerTitle: false,
          title: const Text(
            'All Offices',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              height: 33.89 / 28,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(
            top: 12,
          ),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ExpansionCard();
            },
          ),
        ));
  }
}
