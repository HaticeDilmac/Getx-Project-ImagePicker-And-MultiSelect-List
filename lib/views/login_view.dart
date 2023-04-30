// ignore_for_file: unused_field, override_on_non_overriding_member

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_one/controller/home_controller.dart';
import 'package:getx_project_one/general/local_storage/secure_storage.dart';
import 'package:getx_project_one/views/title_section.dart';

import '../controller/image_controller.dart';
import '../general/config.dart';
import '../general/menu/navigation_bar.dart';

class LoginView extends GetView<HomeController> {
  LoginView({super.key});

  final TextEditingController textController = TextEditingController();
  @override
  final HomeController controller = Get.put(HomeController());
  final ImageController _controller = Get.put(ImageController());
  final SecureStorage _secureStorage = SecureStorage();
  void initState() {
    _controller.getData();
    fetchSecureStorageData();
    log(fetchSecureStorageData() as num);
  }

//okunan değerleri field içine ekleriz

  Future<void> fetchSecureStorageData() async {
    textController.text = (await _secureStorage.getHost()) ?? "jhjhjh";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const ClipPathWidget(),
              Form(
                child: Column(
                  children: [
                    buildTextFormField(),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: _buildElevatedButton(context),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),

          //Footer Widget
          Align(
            alignment: Alignment.bottomRight,
            child: buildFooter(),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: TitleSection(
                title: getWelcomeMessage(),
              ),

              // buildText(
              //     data: 'Hoş Geldin, ',
              //     textStyle: const TextStyle(
              //         color: Colors.black,
              //         fontSize: 30,
              //         fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextFormField() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        controller: textController,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          hintText: 'Kullanıcı Adı',
          labelText: 'Kullanıcı Adı',
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            gapPadding: 4.0,
          ),
          isDense: true,
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: context.width),
      child: ElevatedButton(
        onPressed: () {
          _secureStorage.setHost(textController.text);
          Config().Name = textController.text;
          _secureStorage.setHost(textController.text);
          // //telefon numarsının check edildiği fonksiyonu çağırdık ve
          // //Controllerda bulunan texti check edilmesi için parametre olarak koyduk
          // controller.validateAndCheckMobileNumber(
          //     controller.mobileNumberEditingController.text);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NavigationBarPage()));
        },
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          elevation: 10,
          // padding: const EdgeInsets.all(14)
        ),
        child: const Text(
          "Giriş Yap",
          style: TextStyle(
              fontFamily: 'AmaticSC',
              fontSize: 30,
              letterSpacing: 4,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

Widget buildText({required String data, required TextStyle textStyle}) {
  return Text(
    data,
    style: textStyle,
    textAlign: TextAlign.center,
  );
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

Widget buildFooter() {
  return ClipPath(
    clipper: FooterWaveClipper(),
    child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomRight,
            colors: [Colors.pink, Colors.purple]),
      ),
      height: Get.height / 3,
    ),
  );
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height - 60);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//
getGreeting() {
  var currentHour = DateTime.now().hour;
  if (currentHour >= 5 && currentHour < 12) {
    return 'Günaydın';
  } else if (currentHour >= 12 && currentHour < 17) {
    return 'İyi Günler';
  } else if (currentHour >= 17 && currentHour < 20) {
    return 'İyi Akşamlar';
  } else {
    return 'İyi Geceler';
  }
}

getWelcomeMessage() {
  return '${getGreeting()}, ${Config().Name}';
}
