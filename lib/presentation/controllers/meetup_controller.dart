// presentation/controllers/item_display_controller.dart
import 'package:get/get.dart';

class ItemDisplayController extends GetxController {
  var items = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() {
    // Fetch items logic
    items.value = List.generate(5, (index) => 'Item $index');
  }
}
