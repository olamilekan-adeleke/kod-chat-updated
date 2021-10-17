import 'package:get/get.dart';
import 'package:kod_chat/features/search/controllers/search_controllers.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchController>(SearchController());
  }
}
