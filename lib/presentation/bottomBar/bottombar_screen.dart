import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hotel_ci/core/app_export.dart';
import 'package:hotel_ci/model/global_variables.dart';
import 'package:hotel_ci/presentation/bottomBar/bottombar_controller.dart';
import 'package:hotel_ci/presentation/commonWidgets/app_bar.dart';
import 'package:hotel_ci/presentation/favorite/favourite_screen.dart';
import 'package:hotel_ci/presentation/home/home_screen.dart';
import 'package:hotel_ci/presentation/myprofile/my_profile_screen.dart';
import 'package:hotel_ci/presentation/nearYou/near_screen.dart';
import 'package:hotel_ci/presentation/nearYou/near_you_map_screen.dart';
import 'package:hotel_ci/presentation/search/search_screen.dart';
import 'package:hotel_ci/presentation/support/support_screen.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);
  final BottomBarController _con = Get.put(BottomBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        child: ZoomDrawer(
          controller: _con.zoomDrawerController,
          borderRadius: 24.0,
          showShadow: true,
          shadowLayer1Color: const Color(0xffFFD7C2),
          shadowLayer2Color: AppColors.appColor.withOpacity(.5),
          style: DrawerStyle.Style1,
          angle: -0.0,
          mainScreenTapClose: true,
          slideWidth: MediaQuery.of(context).size.width * 0.75,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.4,
              ),
              blurRadius: 1.20,
              offset: const Offset(0.5, 0.6),
            )
          ],
          mainScreen: Scaffold(
            appBar: _con.pageIndex.value == 0
                ? appBar(
                    onTap: () {
                      _con.zoomDrawerController.toggle!();
                    },
                    leading: "menu",
                    text: "",
                  )
                : _con.pageIndex.value == 1
                    ? appBar(
                        onTap: () {
                          _con.zoomDrawerController.toggle!();
                        },
                        leading: "menu",
                        text: "search".tr,
                      )
                    : _con.pageIndex.value == 2
                        ? appBar(
                            onTap: () {
                              _con.zoomDrawerController.toggle!();
                            },
                            text: "onmap".tr,
                            leading: "menu",
                          )
                        : appBar(
                            onTap: () {
                              _con.zoomDrawerController.toggle!();
                            },
                            text: "profile".tr,
                            backgroundColor: AppColors.appColor,
                            textColor: Colors.white,
                            iconColor: Colors.white,
                            leading: "menu",
                          ),
            body: _con.pageIndex.value == 0
                ? HomeScreen()
                : _con.pageIndex.value == 1
                    ? SearchScreen()
                    : _con.pageIndex.value == 2
                        ? NearYouScreen()
                        : _con.pageIndex.value == 3
                            ? MyProfileScreen()
                            : HomeScreen(),
            bottomNavigationBar: bottombar(),
              //MyProfileScreen
          ),
          menuScreen: Scaffold(
            backgroundColor: const Color(0xffFFD7C2),
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Image.asset(
                        ImageConstant.appicon,
                        height: 60,
                      ),
                      const SizedBox(height: 50),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _con.drawerList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _con.isTap.value = index;

                                /*_con.isTap.value == 0
                                    ? Get.toNamed(AppRoutes.reviewsScreen)
                                    : _con.isTap.value == 1
                                        ? Get.toNamed(AppRoutes.historyScreen)
                                        : _con.isTap.value == 2
                                            ?
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => SupportScreen(Id: 'b4e71cc1-2f67-4638-8911-8c95dd740b6a', Montant: '100' ),
                                ) ) : null;*/

                                _con.isTap.value == 0
                                    ? Get.toNamed(AppRoutes.historyScreen)
                                    : _con.isTap.value == 1
                                    ?
                                Deconnect() : null;

                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 15),
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      _con.drawerList[index].image!,
                                      height: 25,
                                      // color: Colors.black,
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      _con.drawerList[index].title!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                      const SizedBox(height: 50),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.appColor,
                            radius: 25,
                            child: CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.grey,
                              backgroundImage: AssetImage(ImageConstant.image),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                GlobalVariable.userName!.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    height: 2),
                              ),

                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // child: Scaffold(
        //   key: _con.scaffoldKey,

        //   // drawer: AppDrawer(),
        //   body: _con.pageIndex.value == 0
        //       ? DashBoardScreen()
        //       : _con.pageIndex.value == 1
        //           ? ClassRoomScreen()
        //           : _con.pageIndex.value == 2
        //               ? MyProfileScreen()
        //               : DashBoardScreen(),
        //   bottomNavigationBar: bottombar(),
        // ),
      ),
    );
  }

  bottombar() {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: AppColors.appColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.appColor.withOpacity(.2),
            blurRadius: 20,
            offset: const Offset(0.5, 0.6),
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _con.icons.length,
            (index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _con.onTap(index),
                  icon: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      _con.pageIndex.value == index
                          ? _con.icons[index][1]
                          : _con.icons[index][0],
                      color: _con.pageIndex.value == index
                          ? Colors.white
                          : Colors.white.withOpacity(.5),
                      height: 30,
                    ),
                  ),
                ),
                Container(
                  height: 2,
                  width: 10,
                  decoration: BoxDecoration(
                    color: _con.pageIndex.value == index
                        ? const Color(0xffE31717)
                        : AppColors.appColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
