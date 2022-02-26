import 'package:flutter/material.dart';
import 'package:peachai/models/listing.dart';
import 'package:peachai/widgets/listing_tile.dart';

import '../listing_details_page.dart';

class MyListingsPage extends StatelessWidget {
  const MyListingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      itemCount: listingData.length,
      itemBuilder: (context, index) => ListingTile(
        data: listingData[index],
      ),
    );
  }
}
