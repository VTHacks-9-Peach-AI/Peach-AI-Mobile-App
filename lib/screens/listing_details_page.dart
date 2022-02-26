import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:peachai/constants.dart';
import 'package:peachai/models/listing.dart';
import 'package:peachai/screens/manage_applicants/manage_applicants.dart';
import 'package:peachai/widgets/filled_outline_button.dart';
import 'package:peachai/widgets/main_button.dart';

import '../widgets/listing_details_tile.dart';

class ListingDetailsPage extends StatelessWidget {
  final Listing listing;

  const ListingDetailsPage({required this.listing});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 350.0,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: List.generate(
                listing.imageList.length,
                (index) => ListingDetailsTile(image: listing.imageList[index]),
              ),
            ),
          ),
          Container(
            height: size.height * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 5, 24),
                  child: Text(
                    listing.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.65,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                        right: 24,
                        left: 24,
                        bottom: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildFeature(Icons.hotel, "2 Bedroom"),
                          buildFeature(Icons.wc, "2 Bathroom"),
                          buildFeature(Icons.kitchen, "1 Kitchen"),
                          buildFeature(Icons.price_check, "\$750"),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MainButton(press: () {}, text: "Edit Listing")),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 25),
                      height: 165,
                      width: size.width,
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF363f93),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(80.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xFF363f93).withOpacity(0.3),
                                offset: const Offset(-10, 0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0),
                          ],
                        ),
                        padding: const EdgeInsets.only(
                            left: 32, top: 20.0, bottom: 50),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Summary: Peach AI",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Interviews: ${listing.interviewed}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Bookings: ${listing.booked}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 130,
                              height: 45,
                              child: FillOutlineButton(
                                  press: () {}, text: "See Results"),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MainButton(
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ManageApplicationsPage(
                                applicants: listing.applicants,
                              );
                            }));
                          },
                          text: "Manage Applicants",
                          color: secondary,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeature(IconData iconData, String text) {
    return Column(
      children: [
        Icon(
          iconData,
          color: primary,
          size: 28,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  List<Widget> buildPhotos(List<String> images) {
    List<Widget> list = [];
    list.add(const SizedBox(
      width: 24,
    ));
    for (var i = 0; i < images.length; i++) {
      list.add(buildPhoto(images[i]));
    }
    return list;
  }

  Widget buildPhoto(String url) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        margin: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
