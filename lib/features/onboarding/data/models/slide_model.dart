class Slide {
  final String title;
  final String description;
  final String image;

  Slide({required this.title, required this.description, required this.image});
}

final List<Slide> slideList = [
  Slide(
    title: 'Find grants you qualify for',
    description: 'Dummy Remember to keep track of your professional accomplishment',
    image: "assets/images/slide1.png"

  ),
  Slide(
    title: 'Keep track of grants you can win',
    description: 'Dummy Understanding the contributions our colleagues make',
    image: "assets/images/slide2.png"

  ),
  Slide(
    title: 'Hire a grant writer with ease',
    description: 'Dummy Take control of notifications, collaborate live or async',
    image: "assets/images/slide3.png"

  ),
];
