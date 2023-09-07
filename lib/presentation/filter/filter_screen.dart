import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/commonWidgets/star_rating.dart';
import 'package:hotel_ci/presentation/filter/filter_controller.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';

class FilterScreen extends StatelessWidget {
  final FilterController _con = Get.put(FilterController());
  FilterScreen({Key? key}) : super(key: key);

  get value => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: "filter".tr),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            commonText('category'.tr),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 35,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _con.categoryList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _con.isSelect.value = index;
                        },
                        child: Obx(
                          () => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: _con.isSelect.value == index
                                  ? AppColors.appColor
                                  : Get.isDarkMode
                                      ? Colors.transparent
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: _con.isSelect.value == index
                                    ? Colors.transparent
                                    : Get.isDarkMode
                                        ? Colors.white54
                                        : AppColors.textGreyColor
                                            .withOpacity(0.5),
                              ),
                            ),
                            child: Text(
                              _con.categoryList[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: _con.isSelect.value == index
                                    ? Colors.white
                                    : AppColors.textGreyColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(height: 20),
            commonText('pricerange'.tr),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: RangeSliderFlutter(
                values: [
                  _con.lowerValue,
                  _con.upperValue,
                ],
                rangeSlider: true,
                tooltip: RangeSliderFlutterTooltip(
                  alwaysShowTooltip: false,
                  disabled: true,
                ),
                min: 0,
                max: 150,
                handlerHeight: 20,
                touchSize: 10,
                centeredOrigin: false,
                trackBar: RangeSliderFlutterTrackBar(
                  activeTrackBarHeight: 5,
                  activeTrackBar: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.appColor,
                  ),
                  inactiveTrackBar: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.textGreyColor,
                  ),
                ),
                textBackgroundColor: AppColors.appColor,
                // textPositionTop: -100,
                // fontSize: 12,
                // onDragging: (handlerIndex, lowerValue, upperValue) {
                //   _con.lowerValue = lowerValue;
                //   _con.upperValue = upperValue;
                //   // setState(() {});
                // },
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.transparent : Colors.white,
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      '\$35.00',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.transparent : Colors.white,
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      '\$120.00',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            commonText('rating'.tr),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  StarRating(
                    onRatingChanged: (val) {},
                    color: Colors.amber,
                    rating: 4,
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: '4.0',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' (Review-120)',
                            style: TextStyle(
                              color: AppColors.textGreyColor,
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            commonText('facilities'.tr),
            const SizedBox(height: 10),
            ListView.builder(
              itemCount: _con.facilitiesList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => facilities(
                index,
                _con.facilitiesList[index],
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(vertical: 15),
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.appColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'showresult'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  facilities(int index, Facilities data) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                alignment: Alignment.center,
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: _con.selectitem.contains(_con.facilitiesList[index].id)
                      ? AppColors.appColor
                      : AppColors.appColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: GestureDetector(
                    onTap: () {
                      _con.isSelected.value = true;
                      item(_con.facilitiesList[index], value);
                    },
                    child:
                        _con.selectitem.contains(_con.facilitiesList[index].id)
                            ? const Icon(
                                Icons.check,
                                size: 17,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.check,
                                color: Colors.transparent,
                                size: 17,
                              )),
              ),
              Text(
                data.name,
                style: TextStyle(
                  color: _con.selectitem.contains(_con.facilitiesList[index].id)
                      ? Colors.black
                      : Colors.grey.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  item(Facilities data, bool? value) {
    if (_con.selectitem.contains(data.id)) {
      _con.selectitem.remove(data.id);
    } else {
      _con.selectitem.add(data.id);
    }
  }

  commonText(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        text!,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
 // Checkbox(
              //   onChanged: (bool? value) =>
              //       item(_con.facilitiesList[index], value!),
              //   value: _con.selectitem.contains(_con.facilitiesList[index].id),
              //   activeColor: AppColors.appColor,
              //   checkColor: Colors.white,
              //   side: BorderSide(color: AppColors.appColor),
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(1)),
              // ),
              // child: Checkbox(
              //   side: BorderSide(color: AppColors.appColor),
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(1)),
              //   checkColor: Colors.white,
              //   activeColor: AppColors.appColor,
              //   value:
              //       _con.selectitem.contains(_con.facilitiesList[index].id),
              //   onChanged: (value) {
              //     item(_con.facilitiesList[index], value!);
              //   },
              // ),