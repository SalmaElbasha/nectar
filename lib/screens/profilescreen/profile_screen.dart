import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nectar/screens/splashscreen/splash_screen.dart';

import '../../services/memory.dart';
import '../../ui/auth/get_user_data/get_user_data_controller.dart';
import '../../widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final List<Map<String, String>> items = [
    {'image': 'assets/images/Orders icon.png', 'title': 'Order'},
    {'image': 'assets/images/My Details icon.png', 'title': 'My Details'},
    {
      'image': 'assets/images/Delicery address.png',
      'title': 'Delivery Address'
    },
    {'image': 'assets/images/payment icon.png', 'title': 'Payment Methods'},
    {'image': 'assets/images/Promo Cord icon.png', 'title': 'Promo Cord'},
    {'image': 'assets/images/Bell icon.png', 'title': 'Notifications'},
    {'image': 'assets/images/help icon.png', 'title': 'Help'},
    {'image': 'assets/images/about icon.png', 'title': 'About'},
  ];

  @override
  Widget build(BuildContext context) {

    return GetBuilder(init: GetUserDataController(),
    builder: (GetUserDataController controller) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: 4,),
      body:controller.isLoading // إذا كانت البيانات لم تُجلب بعد، أظهر شاشة التحميل
      ? Center(child: CircularProgressIndicator())
          : Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 31.5,
                    child: Container(
                      width: 63,
                      height: 63,
                      child: ClipOval(
                        child: Image.network(
                          controller.user?.photoPath??"",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.user?.username??"",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        controller.user?.email??"",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Color(0xffE2E2E2),
            thickness: 2.0,
            indent: 16.0,
            endIndent: 16.0,
          ),
          Container(
            height: Get.height * 0.65,
            child: ListView.builder(
              itemCount: items.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = items[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,bottom: 10,top: 10),
                      child: InkWell(
                        onTap: () {
                          print("22");
                        },
                        highlightColor: Colors.transparent,
                        // Makes the highlight color transparent
                        splashColor: Colors.transparent,
                        // Makes the splash color transparent
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 22.0,
                                  height: 19.8,
                                  child: Image.asset(
                                    item['image']!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  item['title']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                                size: 28.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xffE2E2E2),
                      thickness: 2.0,
                      indent: 16.0,
                      endIndent: 16.0,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: Get.height * 0.1,
            child: Center(
              child: ElevatedButton(
                onPressed: () async{
                  await Get.find<CacheHelper>().loggingOut();
                  Get.to(()=>SplashScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage("assets/images/exit.png"),
                      width: 18,
                      height: 18,
                    ),
                    Container(
                      width: Get.width * 0.6,
                      child: Center(
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xff53B175),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width:
                            18), // to create space equivalent to the image width
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF2F3F2),
                  fixedSize: Size(Get.width * 0.9, Get.height * 0.08),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );});
  }
}
