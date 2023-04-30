import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../model/employee.dart';

class HomeController extends GetxController {
  // late GlobalKey<FormState> formKey;
  // late TextEditingController mobileNumberEditingController;
  // bool isFormValid = false;
  // //Get Storage değişkenimizi Tanımlıyoruz,GetStorage'dan türettiğimiz.
  // late final GetStorage _getStorage;
  // //Dark modun durumunu bildirmek için...
  // var isDarkMode = false.obs;

  List<Employee> list = [];

  @override
  void onInit() {
    super.onInit();
    //Telefonun üst barını transparan yapıyoruz.
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    List.generate(
        20,
        (index) =>
            list.add(Employee(name: 'Name $index', isSelected: false.obs)));
  }
}
//     //Burada GetStorage Fonksiyonunu değişkenimize init ederken gelmesni isityoeuz.
//     _getStorage = GetStorage();
//     formKey = GlobalKey<FormState>();
//     //Dark moddaki okunan değeri darkmode value ya eşitliyoruzz.
//     // isDarkMode.value = _getStorage.read(GetStorageKey.IS_DARK_MODE);
//     //controllera textfield içindeki değeri atıyoruz.
//     mobileNumberEditingController = TextEditingController();
//   }

// //Var olan TextField içindekileri daha sonradan dispose ediyoruz.
//   @override
//   void onClose() {
//     mobileNumberEditingController.dispose();
//   }

// //TextFileddaki validasyoon işlemini halledeceğimiz kısım;
//   String? validateMobile(String value) {
//     if (value.length < 10) {
//       return 'Provide valid mobile number';
//     }
//     return null;
//   }

// //Validasyon işleminde kullanacağımız fonksiyon;
//   void validateAndCheckMobileNumber(String mobileNumber) {
//     //formkey 'in anlık validasyon edilmiş hali yani aktif pasif halini isformValid'e atıyoruz.
//     isFormValid = formKey.currentState!.validate();
//     if (!isFormValid) {
//       //Eğerki isFormValid true ise boş döndür
//       return;
//     } else {
//       //false ise anlık durumunu kaydet.
//       formKey.currentState!.save();
//     }
//   }

//   void changeTheme(BuildContext context) {
//     //tema darkmodda ise uygulama teması açık değilse dark temada olacak
//     final theme =
//         Get.isDarkMode ? AppThemes.lightThemeData : AppThemes.darkThemeData;

//     //Tema switchini açıyoruz
//     ThemeSwitcher.of(context).changeTheme(theme: theme);
//     //_getStoragedaki key okunsun
//     if (_getStorage.read(GetStorageKey.IS_DARK_MODE)) {
//       _getStorage.write(GetStorageKey.IS_DARK_MODE, false);
//       isDarkMode.value = false;
//     } else {
//       //storagekeydeki mod eğer dark mod değilse yazdır.Ve true olsun.
//       _getStorage.write(GetStorageKey.IS_DARK_MODE, true);
//       isDarkMode.value = true;
//     }
//   }
 
