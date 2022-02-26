import 'package:flutter/material.dart';
import 'package:peachai/constants.dart';
import 'package:peachai/models/listing.dart';
import 'package:peachai/screens/manage_applicants/book_viewing_page.dart';
import 'package:peachai/screens/manage_applicants/schedule_interview_page.dart';
import 'package:tabbar/tabbar.dart';

class ManageApplicationsPage extends StatelessWidget {
  final controller = PageController();
  final List<Applicant> applicants;

  ManageApplicationsPage({required this.applicants});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: appBgColor,
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.amberAccent,
            tabs: [
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.call, size: 18),
                    SizedBox(width: 8),
                    Text('Schedule Interviews'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.calendar_month, size: 18),
                    SizedBox(width: 8),
                    Text('Book Viewing'),
                  ],
                ),
              ),
            ],
          ),
          title: const Text('Manage Applications'),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            ScheduleInterViewPage(
              applicants: applicants,
            ),
            BookViewingPage(
              applicants: applicants,
            ),
          ],
        ),
      ),
    );
  }
}
