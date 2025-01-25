import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/home_Screen/home_screen.dart';

import '../../widgets/background_widget/custom_background_widget.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  final SingleValueDropDownController zoneController = SingleValueDropDownController();
  final SingleValueDropDownController areaController = SingleValueDropDownController();

  @override
  void dispose() {
    zoneController.dispose();
    areaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    FocusNode searchFocusNode = FocusNode();
    FocusNode textFieldFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes the shadow
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff181725),
            size: 25,
          ),
        ),
      ),
      body:CustomBackgroundWidget(
        page: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.55,
                  height: Get.height * 0.2,
                  child: Image.asset(
                    "assets/images/location.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "Select Your Location",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff181725),
                  ),
                ),
                Text(
                  "Switch on your location to stay in tune with",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff7C7C7C),
                  ),
                ),
                Text(
                  "what’s happening in your area",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff7C7C7C),
                  ),
                ),              ],
            ),
            Container(
              height: Get.height*0.24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: Get.width *0.93,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Your Zone",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Color(0xff7C7C7C),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width * 0.9,
                        child: DropDownTextField(
                          dropDownIconProperty: IconProperty(
                            icon: Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff7C7C7C),
                            size: 27,
                          ),
                          controller: zoneController,
                          clearOption: true,
                          enableSearch: true,
                          clearIconProperty: IconProperty(color: Colors.green),
                          searchTextStyle: const TextStyle(color: Colors.red),
                          searchDecoration: const InputDecoration(
                            hintText: "Enter your custom hint text here",
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,
                          dropDownList: const [
                            DropDownValueModel(name: 'New York', value: "New York"),
                            DropDownValueModel(name: 'Los Angeles', value: "Los Angeles"),
                            DropDownValueModel(name: 'Chicago', value: "Chicago"),
                            DropDownValueModel(name: 'Houston', value: "Houston"),
                            DropDownValueModel(name: 'Phoenix', value: "Phoenix"),
                            DropDownValueModel(name: 'Philadelphia', value: "Philadelphia"),
                            DropDownValueModel(name: 'San Antonio', value: "San Antonio"),
                            DropDownValueModel(name: 'San Diego', value: "San Diego"),
                            DropDownValueModel(name: 'Dallas', value: "Dallas"),
                            DropDownValueModel(name: 'San Jose', value: "San Jose"),
                          ],
                          onChanged: (val) {},
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: Get.width *0.93,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Your Area",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Color(0xff7C7C7C),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width * 0.9,
                        child: DropDownTextField(
                          dropDownIconProperty: IconProperty(
                            icon: Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff7C7C7C),
                            size: 27,
                          ),
                          controller: areaController,
                          clearOption: true,
                          enableSearch: true,
                          clearIconProperty: IconProperty(color: Colors.green),
                          searchTextStyle: const TextStyle(color: Colors.red),
                          searchDecoration: const InputDecoration(
                            hintText: "Enter your custom hint text here",
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,
                          dropDownList: const [
                            DropDownValueModel(name: 'Manhattan, New York', value: "Manhattan, New York"),
                            DropDownValueModel(name: 'Hollywood, Los Angeles', value: "Hollywood, Los Angeles"),
                            DropDownValueModel(name: 'Lincoln Park, Chicago', value: "Lincoln Park, Chicago"),
                            DropDownValueModel(name: 'Downtown, Houston', value: "Downtown, Houston"),
                            DropDownValueModel(name: 'Scottsdale, Phoenix', value: "Scottsdale, Phoenix"),
                            DropDownValueModel(name: 'Center City, Philadelphia', value: "Center City, Philadelphia"),
                            DropDownValueModel(name: 'Alamo Heights, San Antonio', value: "Alamo Heights, San Antonio"),
                            DropDownValueModel(name: 'La Jolla, San Diego', value: "La Jolla, San Diego"),
                            DropDownValueModel(name: 'Uptown, Dallas', value: "Uptown, Dallas"),
                            DropDownValueModel(name: 'Willow Glen, San Jose', value: "Willow Glen, San Jose"),
                          ],
                          onChanged: (val) {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(onPressed: (){
                Get.to(()=>HomeScreen());
              },
                  child: Center(child: Text("Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                  ),),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff53B175),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: Size(Get.width*0.85, Get.height*0.075)
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
