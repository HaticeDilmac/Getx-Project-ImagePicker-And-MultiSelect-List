import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/image_controller.dart';
import '../config.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  void initState() {
    super.initState();
    _controller.getData();
  }

  final ImageController _controller = Get.put(ImageController());

  //Get photo from gallery
  Widget getImageCircle() {
    return Obx(
      () => ClipOval(
          child: Image.file(
        File(_controller.imgPath!.value),
        cacheWidth: 100,
        cacheHeight: 100,
        errorBuilder: (context, error, stackTrace) {
          return const CircleAvatar(
              radius: 50, backgroundImage: AssetImage('assets/images.jpg'));
        },
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        surfaceTintColor: Colors.green,
        backgroundColor: Colors.pink,
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                getImageCircle(),
                Text(Config().Name),
              ],
            )),
            const ListTile(
                title: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1,text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1',
            )),
            InkWell(
              onTap: () async {
                Uri image = Uri.parse('tel:+09 55555555');
                if (!await launchUrl(image)) throw 'Could not launch';
                // if (await canLaunchUrl(call)) {
                //   launchUrl(call);
                // } else {
                //   throw 'Could not launch $call';
                // }
              },
              child: const ListTile(
                  title: Text(
                '0538 430 ',
              )),
            ),
            InkWell(
              onTap: () {
                //  customLaunch(

                //    'mailto:haticedilmac.1011@gmail.com'); //hang, maile iletmek istiyorsak
              },
              child: const ListTile(
                  title: Text(
                'haticedilma@gmail.com',
              )),
            ),
            const ListTile(
                title: Text(
              'Birinci Eleman',
            ))
          ],
        ));
  }
}
