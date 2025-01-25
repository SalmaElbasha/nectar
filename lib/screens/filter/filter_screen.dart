import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custombottom/custom_button.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // List of options for categories with their selected state
  final List<Map<String, dynamic>> _categoryOptions = [
    {'title': 'Eggs', 'isChecked': false},
    {'title': 'Noodles & Pasta', 'isChecked': false},
    {'title': 'Chips & Crisps', 'isChecked': false},
    {'title': 'Fast Food', 'isChecked': false},
  ];

  // List of options for brands with their selected state
  final List<Map<String, dynamic>> _brandOptions = [
    {'title': 'Individual Callection', 'isChecked': false},
    {'title': 'Cocola', 'isChecked': false},
    {'title': 'Ifad', 'isChecked': false},
    {'title': 'Kazi Farmas', 'isChecked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Filters",
          style: TextStyle(
              color: Color(0xff181725),
              fontSize: 23,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: Get.width,
        height: Get.height * 0.9995,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(-10, 150),
            ),
          ],
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(25)),
        ),


          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 26),
                    ),
                  ],
                ),
              ),
              // Add the Checkbox List for Categories
              Container(
                height: Get.height * 0.3,
                child: ListView(
                  children: _categoryOptions.map((option) {
                    return CheckboxListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      activeColor: Color(0xff53B175),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      title: Text(
                        option['title'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: option['isChecked']
                              ? Color(0xff53B175) // Green color when checked
                              : Colors.black, // Default color when unchecked
                        ),
                      ),
                      value: option['isChecked'],
                      onChanged: (bool? value) {
                        setState(() {
                          option['isChecked'] = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      visualDensity: VisualDensity(horizontal: -2, vertical: -2),// Position checkbox on the left
                    );
                  }).toList(),
                ),
              ),
              Container(

                width: Get.width * 0.27,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Brand",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 26),
                    ),
                  ],
                ),
              ),
              // Add the Checkbox List for Brands
              Container(
                height: Get.height * 0.3,
                child: ListView(
                  children: _brandOptions.map((option) {
                    return CheckboxListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      activeColor: Color(0xff53B175),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      title: Text(
                        option['title'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: option['isChecked']
                              ? Color(0xff53B175) // Green color when checked
                              : Colors.black, // Default color when unchecked
                        ),
                      ),
                      value: option['isChecked'],
                      onChanged: (bool? value) {
                        setState(() {
                          option['isChecked'] = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      visualDensity: VisualDensity(horizontal: -2, vertical: -2),// Position checkbox on the left
                    );
                  }).toList(),
                ),
              ),
              Center(
                child: CustomButton(
                  onPressed: () {},
                  text: 'Apply Filter',
                ),
              ),
            ],
          ),

      ),
    );
  }
}
