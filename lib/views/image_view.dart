import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_one/controller/image_controller.dart';

class ImageView extends StatefulWidget {
  ImageView({super.key});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final ImageController _controller = Get.put(ImageController());

  @override
  void initState() {
    super.initState();
    _controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, //geri dönüş butonunu kaldırı

          backgroundColor: const Color.fromARGB(255, 238, 65, 123),
          centerTitle: true,
          title: const Text('Image from Galerry')),
      body: Column(
        children: [
          Container(
            height: 70,
          ),
          Stack(
            children: [
              getImageCircle(),
              buildGetImageIcon(),
            ],
          ),
          getDeleteDataButton()
        ],
      ),
    );
  }

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

//Galery image delete Button
  Widget getDeleteDataButton() {
    return Positioned(
      top: 50,
      left: 60,
      child: TextButton(
        child: const Text('Resmİ Kaldır',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'AmaticSC',
                fontSize: 30,
                color: Colors.pink)),
        onPressed: () {
          _controller.deleteData();
        },
      ),
    );
  }

  Widget buildGetImageIcon() {
    return Positioned(
      left: 60,
      top: 60,
      child: IconButton(
          onPressed: () {
            _controller.getImg();
          },
          icon: const Icon(
            Icons.photo_camera,
            color: Colors.pink,
          )),
    );
  }
}
