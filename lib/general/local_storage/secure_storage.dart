// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import '../config.dart';

// //SecureStorage clasını oluştururuz.
// class SecureStorage {
// //Flutter secure Storage fonksiyonunu değişkene dahil ediyoruz.
//   final storage = const FlutterSecureStorage();
//   String name = '';
//   Future setName(String user) async {
//     //set fonksiyonunda girilen değeri yazmamıza yani set etmemize yarar
//     storage.write(key: name, value: Config().Name);
//   }

//   Future<String?> getName() async {
//     return storage.read(key: name);
//   }
// }

// // ignore_for_file: unused_import

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getx_project_one/general/config.dart';

class SecureStorage {
  String host = "";
  // Create storage
  final storage = const FlutterSecureStorage();

  Future setHost(String text) async {
    //write
    await storage.write(key: "Config.PREF_HOST", value: Config().Name);
  }

  Future<String?> getHost() async {
    //read

    return await storage.read(key: "Config.PREF_HOST");
    //  ==true??
    //     await storage.read(key: Config.PREF_HOST):storage.write(key: Config.PREF_HOST, value:'77.92.107.155');
  }
}
