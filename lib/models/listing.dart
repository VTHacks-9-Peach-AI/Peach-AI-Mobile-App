class Listing {
  final String description, address, time;
  final bool isActive;
  final double price;
  final List<String> imageList;
  final int numApplicants, interviewed, booked;
  final List<Applicant> applicants;

  Listing(
      {required this.description,
      required this.imageList,
      required this.time,
      required this.address,
      required this.isActive,
      required this.numApplicants,
      required this.interviewed,
      required this.booked,
      required this.price,
      required this.applicants});
}

class Applicant {
  final String name, phoneNumber;

  Applicant({required this.name, required this.phoneNumber});
}

List<Applicant> applicantsData = [
  Applicant(name: "Samir Aliyev", phoneNumber: "2508641559"),
  Applicant(name: "Vrushank Kekre", phoneNumber: "3065702593"),
  Applicant(name: "Ayush Mujumdar", phoneNumber: "5875857584")
];

List listingData = [
  Listing(
      description: "2 Bed 2 Bath Apartment ",
      address: "307-975 Academy Way, V1V3C8",
      imageList: house1data,
      time: "3w ago",
      interviewed: 1,
      booked: 1,
      isActive: true,
      price: 700.0,
      numApplicants: 170,
      applicants: applicantsData),
  Listing(
      description: "Nice appartment with single bed ",
      address: "Vancouver, BC V6M 3W6, Canada",
      imageList: house2data,
      time: "2w ago",
      isActive: true,
      interviewed: 1,
      booked: 1,
      price: 700.0,
      numApplicants: 3,
      applicants: applicantsData),
  Listing(
      description: "3 Bed 3 Bath near University",
      address: "402-975 Academy Way, V1V3C8",
      imageList: house3data,
      time: "3w ago",
      isActive: true,
      interviewed: 2,
      booked: 1,
      price: 700.0,
      numApplicants: 3,
      applicants: applicantsData),
  Listing(
      description: "2 Bed 2 Bath near Downtown",
      address: "Vancouver, BC V5P 3W2",
      imageList: house4data,
      time: "3w ago",
      isActive: true,
      interviewed: 2,
      booked: 1,
      price: 700.0,
      numApplicants: 170,
      applicants: applicantsData),
];

List<String> house1data = [
  "assets/images/a1image1.jpeg",
  "assets/images/a1image2.jpeg",
  "assets/images/a1image3.jpeg",
  "assets/images/a1image4.jpeg"
];

List<String> house2data = [
  "assets/images/a2image1.jpeg",
  "assets/images/a2image2.jpeg",
  "assets/images/a2image3.jpeg",
  "assets/images/a2image4.jpeg"
];

List<String> house3data = [
  "assets/images/a3image1.jpeg",
  "assets/images/a3image2.jpeg",
  "assets/images/a3image3.jpeg",
  "assets/images/a3image4.jpeg"
];

List<String> house4data = [
  "assets/images/a4image1.jpeg",
  "assets/images/a4image2.jpeg",
  "assets/images/a4image3.jpeg",
  "assets/images/a4image4.jpeg"
];
