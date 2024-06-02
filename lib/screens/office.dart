import 'package:assessment/dto/company_dto.dart';
import 'package:assessment/dto/user_dto.dart';
import 'package:assessment/service/user_service.dart';
import 'package:assessment/utils/add_staff_member.dart';
import 'package:assessment/utils/floating_action_button.dart';
import 'package:assessment/widgets/avatar_picker.dart';
import 'package:assessment/widgets/expansion_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class OfficeScreen extends StatefulWidget {
  final CompanyDTO dto;
  const OfficeScreen({super.key, required this.dto});

  @override
  State<OfficeScreen> createState() => _OfficeScreenState();
}

class _OfficeScreenState extends State<OfficeScreen> {
  List<UserDto> users = [];

  bool doItJustOnce = false;
  List<UserDto> filteredList = [];
  Future<void> _showEditDialog() async {
    PageController _controller = PageController();
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
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

  void _search(String query) {
    setState(() {
      filteredList = users.where((user) {
        var name = user.name.toLowerCase().split("").toSet();
        var querySet = query.toLowerCase().split("").toSet();
        return name.containsAll(querySet);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppFloatingActionButton(
        onPressed: () {
          setState(() {
            addStaffMember(context, widget.dto);
          });
        },
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
              ExpansionCard(dto: widget.dto, navigatable: false),
              const SizedBox(
                height: 16,
              ),
              SearchBar(
                elevation: MaterialStateProperty.all(0),
                trailing: const [Icon(Icons.search)],
                hintText: "Search",
                onChanged: _search,
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
                    "",
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
              FutureBuilder<List<UserDto>>(
                  future: UserService().getUsersByCompanyId(widget.dto.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      users = snapshot.data!;
                      if (!doItJustOnce) {
                        //You should define a bool like (bool doItJustOnce = false;) on your state.
                        users = snapshot.data!;
                        filteredList = users;
                        doItJustOnce =
                            !doItJustOnce; //this line helps to do just once.
                      }
                    }
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
                          shrinkWrap: true,
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: ListTile(
                                title: Text(
                                  filteredList[index].name,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                leading: SvgPicture.asset(
                                  filteredList[index].avatar,
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.more_vert_outlined),
                                  onPressed: () {
                                    // _showEditDialog();
                                  },
                                ),
                                // trailing: const Icon(),
                              ),
                            );
                          },
                        );
                      }
                    }
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
