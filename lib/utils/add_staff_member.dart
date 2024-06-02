import 'package:assessment/dto/company_dto.dart';
import 'package:assessment/dto/user_dto.dart';
import 'package:assessment/service/user_service.dart';
import 'package:assessment/widgets/avatar_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

void addStaffMember(BuildContext context, CompanyDTO dto) {
  PageController controller = PageController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String avatar = "";
  var uuid = const Uuid();

  showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(builder: (context, constraints) {
          return AlertDialog(
            title: const Text(
              "New Staff Member",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            content: SingleChildScrollView(
              child: SizedBox(
                height: constraints.maxHeight * 0.35,
                width: constraints.maxWidth,
                child: PageView(
                  controller: controller,
                  children: [
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                            controller: firstNameController,
                            decoration: const InputDecoration(
                                labelText: "First Name",
                                border: InputBorder.none),
                          ),
                          TextField(
                            controller: lastNameController,
                            decoration: const InputDecoration(
                                labelText: "Last Name",
                                border: InputBorder.none,
                                fillColor: Colors.white),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.8,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFF489DDA)),
                              onPressed: () async {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: const Text("Next"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Avatar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AvatarPicker(
                          onAvatarChange: (path) {
                            avatar = path;
                          },
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.7,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: const Color(0xFF489DDA)),
                            onPressed: () async {
                              final name =
                                  "${firstNameController.text} ${lastNameController.text}";
                              UserDto userDto = UserDto(
                                avatar: avatar,
                                name: name,
                                id: uuid.v4(),
                                companyId: dto.id,
                              );
                              await UserService().createUser(userDto.toMap());
                    
                              context.pop();
                            },
                            child: const Text("Add Staff Member"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
      });
}
