import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxList onSelectFavourite = [].obs;

  onSelect(int index) {
    if (onSelectFavourite.contains(index)) {
      onSelectFavourite.remove(index);
    } else {
      onSelectFavourite.add(index);
    }
  }
}
