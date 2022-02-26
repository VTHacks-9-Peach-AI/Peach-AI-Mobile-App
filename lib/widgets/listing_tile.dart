import 'package:flutter/material.dart';
import 'package:peachai/constants.dart';
import 'package:peachai/models/listing.dart';
import 'package:peachai/screens/listing_details_page.dart';

import 'custom_image.dart';

class ListingTile extends StatelessWidget {
  const ListingTile({Key? key, required this.data}) : super(key: key);
  final Listing data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ListingDetailsPage(listing: data);
        }));
      },
      child: Container(
        width: double.infinity,
        height: 240,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            CustomImage(
              data.imageList[0],
              radius: 25,
              width: double.infinity,
              height: 150,
            ),
            Positioned(
                left: 15,
                top: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.place_outlined,
                          color: darker,
                          size: 13,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          data.address,
                          style: const TextStyle(fontSize: 13, color: darker),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${data.price.toString()}",
                          style: const TextStyle(
                              fontSize: 15,
                              color: primary,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Text(
                          "${data.numApplicants} Interested Applicants",
                          style: const TextStyle(
                              fontSize: 15,
                              color: primary,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
