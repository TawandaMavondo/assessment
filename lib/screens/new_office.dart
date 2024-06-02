import 'package:assessment/dto/company_dto.dart';
import 'package:assessment/service/company_service.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class NewOfficeScreen extends StatefulWidget {
  const NewOfficeScreen({super.key});

  @override
  State<NewOfficeScreen> createState() => _NewOfficeScreenState();
}

class _NewOfficeScreenState extends State<NewOfficeScreen> {
  TextEditingController officeNameController = TextEditingController();
  TextEditingController physicalAddressController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController memberCapacityController = TextEditingController();

  Color officeColor = Color(0xffFFBE0B);

  Future<void> addNewOffice() async {
    // Add new office to the database
    var uuid = const Uuid();

    CompanyDTO companyDTO = CompanyDTO(
      id: uuid.v4(),
      name: officeNameController.text,
      address: physicalAddressController.text,
      email: emailAddressController.text,
      phone: phoneNumberController.text,
      capacity: int.parse(memberCapacityController.text),
      color: officeColor.hex,
    );

    var service = CompanyService();
    await service.createCompany(companyDTO.toMap());
    // ignore: use_build_context_synchronously
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text("New Office "),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: officeNameController,
                  decoration: const InputDecoration(
                    labelText: "Office Name",
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: physicalAddressController,
                  decoration: const InputDecoration(
                    labelText: "Physical Address",
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: emailAddressController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email Address",
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: memberCapacityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Maximum Member Capacity",
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Office Color",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                BlockPicker(
                  pickerColor: Color(0xffFFBE0B),
                  useInShowDialog: true,
                  availableColors: const [
                    Color(0xffFFBE0B),
                    Color(0xFFFF9B71),
                    Color(0xFFFB5607),
                    Color(0xFF97512C),
                    Color(0xFFDBBADD),
                    Color(0xFFFF006E),
                    Color(0xFFA9F0D1),
                    Color(0xFF00B402),
                    Color(0xFF489DDA),
                    Color(0xFF0072E8),
                    Color(0xFF8338EC)
                  ],
                  onColorChanged: (color) {
                    setState(() {
                      officeColor = color;
                    });
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF489DDA),
                        foregroundColor: Colors.white),
                    onPressed: () async {
                      await addNewOffice();
                    },
                    child: const Text("Add Office"),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
