import 'package:get/get.dart';

class Employee {
  final String name;
  //Bool seğişkene anlık olarak obs ile erişmemiz için false.obs
  var isSelected = false.obs;
  Employee({required this.name, required this.isSelected});
}
