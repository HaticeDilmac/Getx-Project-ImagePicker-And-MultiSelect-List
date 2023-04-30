import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_one/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 238, 65, 123),
          automaticallyImplyLeading: false, //geri dönüş butonunu kaldırı
          title: const Text('Multi Select ListView ')),
      body: ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: ((context, index) {
            return Obx(
              () => GestureDetector(
                onTap: () {
                  //Listemizin true false durumunu kontrol ediyoruz.
                  //Controllerda bulunan listenin
                  controller.list[index].isSelected.value =
                      !controller.list[index].isSelected.value;
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 14, bottom: 14),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //Eğer liste elemanı seçilmemişse gri seçilmişsi yeşil olsun
                      color: controller.list[index].isSelected.value
                          ? Colors.green
                          : Colors.grey),
                  child: Text(controller.list[index].name),
                ),
              ),
            );
          })),
    );
  }
}
