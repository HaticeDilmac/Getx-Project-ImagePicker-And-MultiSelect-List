import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_one/views/home_view.dart';
import 'package:getx_project_one/views/image_view.dart';

import '../../controller/image_controller.dart';
import 'drawer.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

final ImageController _controller = Get.put(ImageController());

class _NavigationBarPageState extends State<NavigationBarPage> {
  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    _controller.getData();
  }

  int selectedIndex = 0;
  List page = [const ikinci(), HomeView(), ImageView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.pink,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Anasayfa'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Multi Select List'),
            BottomNavigationBarItem(
                icon: Obx(() {
                  //Navigation bar'da getx ile görsel taşıma sağlandı.
                  return ClipOval(
                      child: Image.file(
                    File(_controller.imgPath!.value),
                    cacheWidth: 40,
                    cacheHeight: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images.jpg'));
                    },
                  ));
                }),
                label: 'Profil Düzenle')
          ],
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          }),
      body: page[selectedIndex],
    );
  }
}

class ikinci extends StatelessWidget {
  const ikinci({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ClipPathWidget(),
          Positioned(
              top: 200,
              left: 270,
              child: Obx(() {
                //Navigation bar'da getx ile görsel taşıma sağlandı.
                return ClipOval(
                    child: Image.file(
                  File(_controller.imgPath!.value),
                  cacheWidth: 100,
                  cacheHeight: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images.jpg'));
                  },
                ));
              }))
        ],
      ),
    );
  }
}

class ucuncu extends StatelessWidget {
  const ucuncu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ClipPathWidget extends StatelessWidget {
  const ClipPathWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomRight,
              colors: [Colors.pink, Colors.purple]),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  // @override
  // Path getClip(Size size) {
  //   Path path = Path();
  //   path.lineTo(0, size.height);
  //   path.arcToPoint(Offset(size.width, size.height),
  //       radius: Radius.elliptical(30, 10));
  //   path.lineTo(size.width, 0);
  //   return path;
  // }
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
