import 'package:assessment/service/company_service.dart';
import 'package:assessment/utils/floating_action_button.dart';
import 'package:assessment/widgets/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final getIt = GetIt.instance;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AppFloatingActionButton(
          onPressed: () {
            context.push('/new/office');
          },
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
          child: FutureBuilder(
            future: getIt<CompanyService>().readCompanies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error fetching data'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return ExpansionCard(dto: snapshot.data![index]);
                    },
                  );
                }
              }
            },
          ),
        ));
  }
}
