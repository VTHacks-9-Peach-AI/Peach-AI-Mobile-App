import 'package:flutter/material.dart';
import 'package:peachai/constants.dart';
import 'package:peachai/models/listing.dart';

class ScheduleInterViewPage extends StatelessWidget {
  ScheduleInterViewPage({Key? key, required this.applicants}) : super(key: key);
  List<Applicant> applicants;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBgColor,
      child: const Center(child: Text("Schedule Interview")),
    );
  }
}
