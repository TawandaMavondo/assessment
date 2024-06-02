import 'package:assessment/dto/company_dto.dart';
import 'package:assessment/service/user_service.dart';
import 'package:assessment/utils/colors_to_gradient.dart';
import 'package:assessment/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

final getIt = GetIt.instance;

class ExpansionCard extends StatefulWidget {
  final CompanyDTO dto;
  final bool navigatable;
  const ExpansionCard({
    super.key,
    required this.dto,
    required this.navigatable,
  });

  @override
  State<ExpansionCard> createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> {
  bool isExpanded = false;
  int staff = 0;

  @override
  void initState() {
    super.initState();
    UserService().getUsersByCompanyId(widget.dto.id).then((value) {
      setState(() {
        staff = value.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.navigatable
          ? context.push('/office/view', extra: widget.dto)
          : "",
      child: Card(
          margin: const EdgeInsets.all(16),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 16,
                height: isExpanded ? 322 : 172,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    // color: Color(0xFF489DDA),
                    gradient:
                        colorToGradient(HexColor.fromHex(widget.dto.color)),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.dto.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.edit_outlined,
                            size: 24,
                            color: Color(0xFF0D4477),
                          ),
                          onPressed: () {
                            context.push('/office/edit/', extra: widget.dto);
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Iconsax.people),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: "$staff ",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: "Staff Members in Office",
                                  style: TextStyle(),
                                )
                              ]),
                        )
                      ],
                    ),
                    const Divider(
                      color: Color(0xFF0D4477),
                    ),
                    ExpansionTile(
                      onExpansionChanged: (value) {
                        setState(() {
                          isExpanded = value;
                        });
                      },
                      expandedAlignment: Alignment.centerLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      trailing: const SizedBox(),
                      title: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("More info"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Iconsax.arrow_down_1)
                        ],
                      ),
                      children: [
                        RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.phone_outlined,
                                    color: Color(0xFF0D4477),
                                  ),
                                ),
                                const WidgetSpan(
                                    child: SizedBox(
                                  width: 10,
                                )),
                                TextSpan(text: widget.dto.phone)
                              ]),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Color(0xFF0D4477),
                                  ),
                                ),
                                const WidgetSpan(
                                    child: SizedBox(
                                  width: 10,
                                )),
                                TextSpan(text: widget.dto.email)
                              ]),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Iconsax.people,
                                    color: Color(0xFF0D4477),
                                  ),
                                ),
                                const WidgetSpan(
                                    child: SizedBox(
                                  width: 10,
                                )),
                                TextSpan(
                                    text:
                                        "Office Capacity: ${widget.dto.capacity}"),
                              ]),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Iconsax.location,
                                    color: Color(0xFF0D4477),
                                  ),
                                ),
                                const WidgetSpan(
                                    child: SizedBox(
                                  width: 10,
                                )),
                                TextSpan(
                                  text: widget.dto.address,
                                )
                              ]),
                        ),
                      ],
                    )
                  ]),
                ),
              )
            ],
          )),
    );
  }
}
