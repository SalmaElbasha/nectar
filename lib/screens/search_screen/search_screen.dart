import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/filter/filter_screen.dart';
import 'package:nectar/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';

import '../../widgets/search_widget/search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _showClearIcon = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _showClearIcon = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: 1,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: Get.height*0.11,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10,top: 15),
                  width: 324.82,
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      suffixIcon: _showClearIcon
                          ? IconButton(
                        onPressed: () {
                          _controller.clear();
                        },
                        icon: Icon(Icons.close),
                        color: Colors.black,
                      )
                          : null,
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Image.asset('assets/images/Group 6839.png'),
                  onPressed: () {
                    Get.to(()=>FilterScreen());
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: Get.width * 0.95,
            height: Get.height-155,
            child: GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 30.0,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) => SearchWidget(index: index),
              scrollDirection: Axis.vertical,

            ),
          ),
        ],
      ),
    );
  }
}
