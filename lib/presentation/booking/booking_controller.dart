import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/core/utils/helper.dart';
import 'package:hotel_ci/model/global_variables.dart';

class BookingController extends GetxController {
  // TextEditingController firstName = TextEditingController();
  // TextEditingController lastName = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController phoneNo = TextEditingController();
  TextEditingController arrivalDate = TextEditingController();
  TextEditingController departureDate = TextEditingController();

  // RxString firstNameError = "".obs;
  // RxString lastNameError = "".obs;
  // RxString emailError = "".obs;
  // RxString phoneNoError = "".obs;
  RxString arrivalDateError = "".obs;
  RxString departureDateError = "".obs;
  RxString quantite = "".obs;
  RxString montant = "".obs;
  RxString arrivalDateText = "".obs;
  RxString departureDateText = "".obs;
  RxBool IsEnable = true.obs;

  BookingController()
  {

    arrivalDate.text = "${_addLeadingZero(GlobalVariable.CurrentClientCommande!.dateDebut!.day)}-${_addLeadingZero(GlobalVariable.CurrentClientCommande!.dateDebut!.month)}-${GlobalVariable.CurrentClientCommande!.dateDebut!.year}";
    departureDate.text = "${_addLeadingZero(GlobalVariable.CurrentClientCommande!.dateFin!.day)}-${_addLeadingZero(GlobalVariable.CurrentClientCommande!.dateFin!.month)}-${GlobalVariable.CurrentClientCommande!.dateFin!.year}";
    arrivalDateText.value = arrivalDate.text;
    departureDateText.value = departureDate.text;

    quantite.value = GlobalVariable.CurrentClientCommande!.quantite.toString();
    montant.value = GlobalVariable.CurrentClientCommande!.montant.toString();

  }

  bool valid() {
    RxBool isValid = true.obs;
    // firstNameError.value = '';
    // emailError.value = '';
    // lastNameError.value = '';
    // phoneNoError.value = '';
    departureDateError.value = '';
    arrivalDateError.value = '';

/*    if (firstName.text.isEmpty) {
      firstNameError.value = "leaseenteravalidfirstname".tr;
      isValid.value = false;
    }
    if (lastName.text.isEmpty) {
      lastNameError.value = "pleaseenteravalidlastname".tr;
      isValid.value = false;
    }
    if (email.text.isEmpty) {
      emailError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    } else if (!Helper.isEmail(email.text)) {
      emailError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    }
    if (phoneNo.text.isEmpty) {
      phoneNoError.value = "pleaseenteravalidphoneno".tr;
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(phoneNo.text)) {
      phoneNoError.value = "pleaseenteravalidphoneno".tr;
      isValid.value = false;
    }*/

    if (arrivalDate.text.isEmpty) {
      arrivalDateError.value = "pleaseselectdate".tr;
      isValid.value = false;
    }
    if (departureDate.text.isEmpty) {
      departureDateError.value = "pleaseselectdate".tr;
      isValid.value = false;
    }


    return isValid.value;
  }

  // Show the modal that contains the CupertinoDatePicker
  void arrivalDatePicker(ctx) async {
    DateTime? date = await showDialog(
      context: ctx,
      builder: (ctx) => DatePickerDialog(
        restorationId: 'date_picker_dialog',
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDate: GlobalVariable.CurrentClientCommande!.dateDebut!,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000),
      ),
    );
    if (date != null) {
      arrivalDate.text =  '${_addLeadingZero(date.day)}-${_addLeadingZero(date.month)}-${date.year}';
      arrivalDateText.value = arrivalDate.text;
      GlobalVariable.CurrentClientCommande!.dateDebut = date;

      try {
        GlobalVariable.CurrentClientCommande!.quantite = calculateDaysBetweenDates(GlobalVariable.CurrentClientCommande!.dateDebut!, GlobalVariable.CurrentClientCommande!.dateFin!).toString();
        GlobalVariable.CurrentClientCommande!.montant = (double.parse(GlobalVariable.CurrentClientCommande!.quantite.toString()) * double.parse(GlobalVariable.CurrentClientCommande!.prixVente!.toString())).toString();
        quantite.value = GlobalVariable.CurrentClientCommande!.quantite.toString();
        montant.value = GlobalVariable.CurrentClientCommande!.montant.toString();
      } catch (e) {
        print("Error: $e"); // Output: Error: FormatException: Invalid number (for input string: "abc")
      }

    }
  }

  void departureDatePicker(ctx) async {
    DateTime? date = await showDialog(
      context: ctx,
      builder: (ctx) => DatePickerDialog(
        restorationId: 'date_picker_dialog',
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDate: GlobalVariable.CurrentClientCommande!.dateFin!,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000),
      ),
    );
    if (date != null) {
      departureDate.text =  '${_addLeadingZero(date.day)}-${_addLeadingZero(date.month)}-${date.year}';
      departureDateText.value = departureDate.text;
      GlobalVariable.CurrentClientCommande!.dateFin = date;

      try {
      GlobalVariable.CurrentClientCommande!.quantite = calculateDaysBetweenDates(GlobalVariable.CurrentClientCommande!.dateDebut!, GlobalVariable.CurrentClientCommande!.dateFin!).toString();
      GlobalVariable.CurrentClientCommande!.montant = (double.parse(GlobalVariable.CurrentClientCommande!.quantite.toString()) * double.parse(GlobalVariable.CurrentClientCommande!.prixVente!.toString())).toString();
      quantite.value = GlobalVariable.CurrentClientCommande!.quantite.toString();
      montant.value = GlobalVariable.CurrentClientCommande!.montant.toString();
      } catch (e) {
        print("Error: $e"); // Output: Error: FormatException: Invalid number (for input string: "abc")
      }

    }
  }

  int calculateDaysBetweenDates(DateTime firstDate, DateTime secondDate) {
    Duration difference = secondDate.difference(firstDate);
    return difference.inDays.abs();
  }

  String _addLeadingZero(int number) {
    return number.toString().padLeft(2, '0');
  }

  payment() {
    if (valid()) {
      Get.toNamed(AppRoutes.paymentScreen);
    } else {
      if (kDebugMode) {
        print("Not valid");
      }
    }
  }
}
