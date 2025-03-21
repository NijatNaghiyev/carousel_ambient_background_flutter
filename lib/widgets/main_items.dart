import 'package:carousel_ambient_background_flutter/data/images.dart';
import 'package:flutter/material.dart';

class MainItems extends StatelessWidget {
  const MainItems({
    super.key,
    required this.size,
    required this.pageController,
  });

  final Size size;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.4,
      child: PageView.builder(
        controller: pageController,
        itemCount: Images.imagesList.length,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Image.network(
              Images.imagesList[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
