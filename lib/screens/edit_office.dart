import 'package:assessment/dto/company_dto.dart';
import 'package:assessment/service/company_service.dart';
import 'package:assessment/utils/extensions.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class EditOfficeScreen extends StatefulWidget {
  final CompanyDTO dto;
  const EditOfficeScreen({super.key, required this.dto});

  @override
  State<EditOfficeScreen> createState() => _EditOfficeScreenState();
}

class _EditOfficeScreenState extends State<EditOfficeScreen> {
  TextEditingController officeNameController = TextEditingController();
  TextEditingController physicalAddressController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController memberCapacityController = TextEditingController();

  late Color officeColor;

  @override
  void initState() {
    super.initState();
    officeNameController.text = widget.dto.name;
    physicalAddressController.text = widget.dto.address;
    emailAddressController.text = widget.dto.email;
    phoneNumberController.text = widget.dto.phone;
    memberCapacityController.text = widget.dto.capacity.toString();
    officeColor = HexColor.fromHex(widget.dto.color);
  }

  Future<void> updateOffice() async {
    // Update office in the database
    CompanyDTO companyDTO = CompanyDTO(
      id: widget.dto.id,
      name: officeNameController.text,
      address: physicalAddressController.text,
      email: emailAddressController.text,
      phone: phoneNumberController.text,
      capacity: int.parse(memberCapacityController.text),
      color: officeColor.hex,
    );

    var service = CompanyService();
    await service.updateCompany(widget.dto.id, companyDTO.toMap());
    context.pop();
  }

Future<void> deleteOffice() async {
    // Delete office in the database
    var service = CompanyService();
    await service.deleteCompany(widget.dto.id);
    context.pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text("Edit Office "),
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
                  pickerColor: officeColor,
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
                      await updateOffice();
                    },
                    child: const Text("Update Office"),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        // backgroundColor: const Color(0xFF489DDA),
                        foregroundColor: Color(0xFF489DDA)),
                    onPressed: () async {
                      // await addNewOffice();
                      await deleteOffice();
                    },
                    child: const Text("Delete Office"),
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
