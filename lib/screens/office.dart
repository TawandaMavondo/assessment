import 'package:assessment/dto/company_dto.dart';
import 'package:assessment/utils/floating_action_button.dart';
import 'package:assessment/widgets/expansion_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OfficeScreen extends StatefulWidget {

  final CompanyDTO dto;
  const OfficeScreen({super.key, required this.dto});

  @override
  State<OfficeScreen> createState() => _OfficeScreenState();
}

class _OfficeScreenState extends State<OfficeScreen> {
  Future<void> _showEditDialog() async {
    PageController _controller = PageController();
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return LayoutBuilder(builder: (context, constraints) {
          return AlertDialog(
            content: SizedBox(
              height: constraints.minHeight * 0.2,
              width: constraints.maxWidth,
              child: PageView(
                controller: _controller,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF489DDA),
                            foregroundColor: Colors.white),
                        onPressed: () {
                          _controller.nextPage(
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                              curve: Curves.easeIn);
                        },
                        child: const Text("Edit Staff Member"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Color(0xFF489DDA)),
                        onPressed: () {},
                        child: const Text("Delete Staff Member"),
                      )
                    ],
                  ),
                  Text("fataga")
                ],
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppFloatingActionButton(
        onPressed: () {},
      ),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text("Office"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(children: [
              ExpansionCard(dto: widget.dto,navigatable:false),
              const SizedBox(
                height: 16,
              ),
              SearchBar(
                elevation: MaterialStateProperty.all(0),
                trailing: const [Icon(Icons.search)],
                hintText: "Search",
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Staff Members in Office",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        height: 33.89 / 28,
                      ),
                    ),
                  ),
                  Text(
                    "11",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      height: 33.89 / 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      title: Text(
                        "Jacques Jordaan",
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: SvgPicture.asset('assets/images/avatar-1.svg'),
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert_outlined),
                        onPressed: () {
                          _showEditDialog();
                        },
                      ),
                      // trailing: const Icon(),
                    ),
                  );
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
