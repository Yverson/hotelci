import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/core/utils/helper.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart' as dio;

class EditProfileController extends GetxController {
  RxString name = "".obs;
  RxString nameError = "".obs;
  Rx<TextEditingController> bod = Rx(TextEditingController(text: ''));
  RxString bodError = "".obs;
  RxString email = "".obs;
  RxString emailError = "".obs;
  RxString phoneNo = "".obs;
  RxString phoneNoError = "".obs;
  Rx<File> profileImg = File("").obs;
  RxString profileUrl = "".obs;
  dio.MultipartFile? multipartFile;
  final ImagePicker picker = ImagePicker();
  Rx<File> profileImage = File("").obs;
  RxBool IsEnable = true.obs;

  TextEditingController nameTE = TextEditingController();
  TextEditingController emailTE = TextEditingController();
  TextEditingController phoneNoTE = TextEditingController();

  EditProfileController()
  {
    name.value = GlobalVariable.CurrentUser!.Noms.toString();
    email.value = GlobalVariable.CurrentUser!.Email.toString();
    phoneNo.value = GlobalVariable.CurrentUser!.Contact1.toString();

    nameTE.text = name.value;
    emailTE.text = email.value;
    phoneNoTE.text = phoneNo.value;
  }

  bool valid() {
    RxBool isValid = true.obs;
    nameError.value = '';
    bodError.value = '';
    emailError.value = '';
    phoneNoError.value = '';

    if (name.isEmpty) {
      nameError.value = "pleaseenteravalidusername".tr;
      isValid.value = false;
    }
    if (bod.value.text.isEmpty) {
      bodError.value = "pleaseenteradateofbirth".tr;
      isValid.value = false;
    }
    if (email.isEmpty) {
      emailError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    } else if (!Helper.isEmail(email.value)) {
      emailError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    }
    if (phoneNo.isEmpty) {
      phoneNoError.value = "pleaseentervalidmobilenumber".tr;
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(phoneNo.value)) {
      phoneNoError.value = "pleaseentervalidmobilenumber".tr;
      isValid.value = false;
    }

    return isValid.value;
  }

  // Show the modal that contains the CupertinoDatePicker
  void showDatePicker(ctx) async {
    DateTime? date = await showDialog(
      context: ctx,
      builder: (ctx) => DatePickerDialog(
        restorationId: 'date_picker_dialog',
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2023),
      ),
    );
    if (date != null) {
      bod.value.text = date.toString();
    }
  }

  void pickProfileFile(context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text("camera".tr),
              onTap: () async {
                Get.back();
                await picImage(false);
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder),
              title: Text("gallery".tr),
              onTap: () async {
                Get.back();
                await picImage(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future picImage(bool fromGallery) async {
    XFile? pickedFile;
    try {
      pickedFile = await picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
        maxHeight: 500,
        maxWidth: 500,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    if (pickedFile != null) {
      File? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 300, ratioY: 300),
        compressQuality: 50,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'edit',
          statusBarColor: AppColors.primaryColor,
          toolbarColor: AppColors.appColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        iosUiSettings: const IOSUiSettings(
          title: 'edit',
        ),
      );
      if (croppedFile != null) {
        profileImg.value = File(croppedFile.path);
        if (kDebugMode) {
          print("===IMAGE SIZE==");
          print(profileImg.value.readAsBytesSync().lengthInBytes);
        }

        multipartFile = dio.MultipartFile.fromFileSync(
          File(croppedFile.path).path,
          filename: path.basename(File(croppedFile.path).path),
        );
        // login();
      }
    } else {
      return;
    }
  }

  // login() {
  //   if (valid()) {
  //   } else {}
  // }
}
