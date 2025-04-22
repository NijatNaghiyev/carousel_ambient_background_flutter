import 'package:carousel_ambient_background_flutter/widgets/app_header.dart';
import 'package:carousel_ambient_background_flutter/widgets/background_items.dart';
import 'package:carousel_ambient_background_flutter/widgets/main_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  late final PageController pageController;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: .9);
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    pageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  int maxLine = 3;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              //? BackgroundItems
              ListenableBuilder(
                listenable: scrollController,
                builder: (context, child) {
                  final value =
                      scrollController.positions.isEmpty
                          ? 0.0
                          : scrollController.offset;
                  return Positioned(
                    top: value > 0.0 ? -value : 0.0,
                    child: child!,
                  );
                },
                child: BackgroundItems(
                  size: size,
                  pageController: pageController,
                ),
              ),

              //? Body
              ListView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                children: <Widget>[
                  //?  AppHeader
                  AppHeader(),

                  //? MainItems
                  MainItems(size: size, pageController: pageController),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        maxLine = maxLine == 3 ? 9 : 3;
                      });
                    },
                    child: const Text('Max Line'),
                  ),
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 10, end: 1),
                    duration: const Duration(milliseconds: 3000),
                    curve: Curves.bounceInOut,
                    builder: (context, value, child) {
                      return Text(
                        'Welcome to My Home Screen' * 10,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        key: ValueKey(maxLine),
                        maxLines: value.toInt(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
