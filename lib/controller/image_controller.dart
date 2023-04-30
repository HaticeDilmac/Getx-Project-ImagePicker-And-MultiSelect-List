// ignore_for_file: unused_import, deprecated_member_use, prefer_interpolation_to_compose_strings

import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageController extends GetxController {
  File? image;
  RxString? imgPath = ''.obs;
  void getImg() async {
    final pickedImage = await ImagePicker()
        .getImage(source: ImageSource.gallery); //galerideki resme erişim
    if (pickedImage != null) //null dönmediği sürece
    {
      await saveData(pickedImage.path.toString()); // path cache
      log(pickedImage.path.toString());
      image = File(pickedImage
          .path); //imgFile diye tanımlanmış olan bu değişken File'dan türeyen
    }
  }

  Future<void> saveData(String val) async {
    //verinin key value şeklinde tutar,yani seçilen resmin yolunu set eder
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString('path', val);
    getData(); //set edildikten sonra data bu set edilen veriyi okuyup kaydediyor.
  }

  Future<void> getData() async {
    final sharedPref = await SharedPreferences.getInstance();
    imgPath!.value = sharedPref.getString('path') as String;
    log("GetData : " + imgPath!.value);
  }

//ben resmi görmek için init içine getDatayı çağırdığm zaman oluyor dur
  void deleteData() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove('path');
    imgPath!.value = '';
    getData();
  }
}
