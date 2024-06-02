import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarPicker extends StatefulWidget {
  late final Function(String path) onAvatarChange;
  AvatarPicker({super.key, required this.onAvatarChange}) {}
  @override
  _AvatarPickerState createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  String selectedAvatar = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedAvatar = 'avatar1';
                  widget.onAvatarChange("assets/images/avatar-1.svg");
                });
              },
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 4,
                      color: selectedAvatar == 'avatar1'
                          ? Color(0xff371A45)
                          : Colors.transparent,
                    ),
                  ),
                  child: SvgPicture.asset("assets/images/avatar-1.svg")),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedAvatar = 'avatar2';
                  widget.onAvatarChange("assets/images/avatar-2.svg");
                });
              },
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 4,
                      color: selectedAvatar == 'avatar2'
                          ? Color(0xff371A45)
                          : Colors.transparent,
                    ),
                  ),
                  child: SvgPicture.asset("assets/images/avatar-2.svg")),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedAvatar = 'avatar3';
                  widget.onAvatarChange("assets/images/avatar-3.svg");
                });
              },
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 4,
                      color: selectedAvatar == 'avatar3'
                          ? Color(0xff371A45)
                          : Colors.transparent,
                    ),
                  ),
                  child: SvgPicture.asset("assets/images/avatar-3.svg")),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedAvatar = 'avatar4';
                  widget.onAvatarChange("assets/images/avatar-4.svg");
                });
              },
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 4,
                      color: selectedAvatar == 'avatar4'
                          ? Color(0xff371A45)
                          : Colors.transparent,
                    ),
                  ),
                  child: SvgPicture.asset("assets/images/avatar-4.svg")),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedAvatar = 'avatar5';
                  widget.onAvatarChange("assets/images/avatar-5.svg");
                });
              },
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 4,
                      color: selectedAvatar == 'avatar5'
                          ? Color(0xff371A45)
                          : Colors.transparent,
                    ),
                  ),
                  child: SvgPicture.asset("assets/images/avatar-5.svg")),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedAvatar = 'avatar6';
                  widget.onAvatarChange("assets/images/avatar-6.svg");
                });
              },
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 4,
                      color: selectedAvatar == 'avatar6'
                          ? Color(0xff371A45)
                          : Colors.transparent,
                    ),
                  ),
                  child: SvgPicture.asset("assets/images/avatar-6.svg")),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedAvatar = 'avatar7';
                  widget.onAvatarChange("assets/images/avatar-7.svg");
                });
              },
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 4,
                      color: selectedAvatar == 'avatar7'
                          ? Color(0xff371A45)
                          : Colors.transparent,
                    ),
                  ),
                  child: SvgPicture.asset("assets/images/avatar-7.svg")),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
