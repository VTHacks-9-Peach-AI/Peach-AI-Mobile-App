import 'package:flutter/material.dart';
import 'package:peachai/constants.dart';
import 'custom_image.dart';

class ListingDetailsTile extends StatelessWidget {
  const ListingDetailsTile({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: CustomImage(
          image,
          radius: 20,
          width: double.infinity,
          height: 250,
        ),
      ),
    );
  }
}
