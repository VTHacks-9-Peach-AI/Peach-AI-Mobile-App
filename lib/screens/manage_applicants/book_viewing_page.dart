import 'package:flutter/material.dart';
import 'package:peachai/constants.dart';
import 'package:peachai/models/listing.dart';
import 'package:peachai/widgets/filled_outline_button.dart';
import 'package:peachai/widgets/main_button.dart';

class BookViewingPage extends StatefulWidget {
  List<Applicant> applicants;
  BookViewingPage({Key? key, required this.applicants}) : super(key: key);

  @override
  State<BookViewingPage> createState() => _BookViewingPageState();
}

class _BookViewingPageState extends State<BookViewingPage> {
  List<bool> checks = [];

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < widget.applicants.length; i++) {
      checks.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    isElementSelected() {
      for (int i = 0; i < checks.length; i++) {
        if (checks[i]) {
          return true;
        }
      }
      return false;
    }

    return SingleChildScrollView(
      child: Column(children: [
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: checks[index],
                  onChanged: (bool? value) {
                    setState(() {
                      checks[index] = value!;
                    });
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.applicants[index].name,
                  style: const TextStyle(fontSize: 18),
                )
              ],
            );
          }),
          itemCount: checks.length,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: MainButton(
              text: "Request for a Booking",
              color: isElementSelected() ? primary : Colors.grey,
              press: () {
                // Do a peach AI
              }),
        )
      ]),
    );
  }
}
