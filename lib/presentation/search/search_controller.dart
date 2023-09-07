import 'package:get/get.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/model/post.dart';

class SearchHotelController extends GetxController {

  RxList<Providers> listeHotel = <Providers>[].obs;


  SearchHotelController()
  {

    listeHotel = <Providers>[].obs;
    for (var item in GlobalVariable.ClientsData!.listeHotel!) {
      print(item);
      listeHotel.value.add(item);
    }

  }


  SearchHotel(List<Providers> lst)
  {

    listeHotel = <Providers>[].obs;
    for (var item in lst!) {
      print(item);
      listeHotel.value.add(item);
    }

  }

}
