import 'package:get/get.dart';

class AddReviewsController extends GetxController {
  // RxInt isSelect = 0.obs;
  RxList onSelect = [].obs;

  setTab(int index) {
    if (onSelect.isNotEmpty) {
      onSelect.removeAt(0);
      onSelect.add(index);
    } else {
      onSelect.add(index);
    }
  }

  // setTab(int i) {
  //   isSelected.value = i;
  // }
}
