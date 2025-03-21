import 'dart:ui';

import 'package:carousel_ambient_background_flutter/data/images.dart';
import 'package:flutter/material.dart';

class BackgroundItems extends StatelessWidget {
  const BackgroundItems({
    super.key,
    required this.size,
    required this.pageController,
  });

  final Size size;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    double getIndexPage() {
      if (pageController.positions.isEmpty) {
        return 0.0;
      }

      return pageController.page?.toDouble() ?? 0.0;
    }

    return SizedBox(
      height: size.height * 0.4 + MediaQuery.of(context).padding.top + 90,
      child: Stack(
        children:
            Images.imagesList.map((e) {
              final index = Images.imagesList.indexOf(
                e,
              ); // Changed to use indexOf directly
              return ListenableBuilder(
                listenable: pageController,
                builder: (context, _) {
                  return Opacity(
                    opacity: (1 - ((index) - (getIndexPage())).abs()).clamp(
                      0.0,
                      1.0,
                    ),
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(e.imageUrl),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(
                              alpha: .4,
                            ), // Fixed withOpacity
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
      ),
    );
  }
}
