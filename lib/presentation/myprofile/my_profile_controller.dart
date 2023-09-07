import 'package:hotel_ci/core/app_export.dart';

class MyProfileController extends GetxController {
  RxInt isSelect = 0.obs;

  RxList<ProfileList> profileList = RxList([
    ProfileList(
      title: "Modifier le profil".tr,
      image: ImageConstant.editprofile,
    ),
    ProfileList(
      title: "aboutus".tr,
      image: ImageConstant.info,
    ),
    ProfileList(
      title: "Mes Reservations".tr,
      image: ImageConstant.history,
    ),
  ]);
}

class ProfileList {
  String? title;
  String? image;

  ProfileList({
    this.title,
    this.image,
  });
}
