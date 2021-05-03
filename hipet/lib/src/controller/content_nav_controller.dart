import 'package:get/get.dart';

class ContentNavController extends GetxController {
  final _selectedIndex = 0.obs;

  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;
}