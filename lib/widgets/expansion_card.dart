import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ExpansionCard extends StatefulWidget {
  const ExpansionCard({
    super.key,
  });

  @override
  State<ExpansionCard> createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(16),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 10,
              height: isExpanded ? 322 : 172,
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF489DDA),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      // end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF489DDA),
                        Color(0xD9489DDA),
                        Color(0x8C489DDA),
                      ]),
                  borderRadius: BorderRadius.only(
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
                      const Text(
                        "Specno",
                        style: TextStyle(
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
                        onPressed: () {},
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
                            children: const [
                              TextSpan(
                                text: "5 ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
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
                            children: const [
                              WidgetSpan(
                                child: Icon(
                                  Icons.phone_outlined,
                                  color: Color(0xFF0D4477),
                                ),
                              ),
                              WidgetSpan(
                                  child: SizedBox(
                                width: 10,
                              )),
                              TextSpan(text: "082 364 9864")
                            ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RichText(
                        text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: const [
                              WidgetSpan(
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Color(0xFF0D4477),
                                ),
                              ),
                              WidgetSpan(
                                  child: SizedBox(
                                width: 10,
                              )),
                              TextSpan(text: "info@specno.com")
                            ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RichText(
                        text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: const [
                              WidgetSpan(
                                child: Icon(
                                  Iconsax.people,
                                  color: Color(0xFF0D4477),
                                ),
                              ),
                              WidgetSpan(
                                  child: SizedBox(
                                width: 10,
                              )),
                              TextSpan(text: "Office Capacity: 25")
                            ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RichText(
                        text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: const [
                              WidgetSpan(
                                child: Icon(
                                  Iconsax.location,
                                  color: Color(0xFF0D4477),
                                ),
                              ),
                              WidgetSpan(
                                  child: SizedBox(
                                width: 10,
                              )),
                              TextSpan(
                                  text: "10 Willie Van Schoor Dr, Bo Oakdale")
                            ]),
                      ),
                    ],
                  )
                ]),
              ),
            )
          ],
        ));
  }
}
