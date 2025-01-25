import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX if you're using it for navigation
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nectar/screens/enteryourcode/enter_your_code.dart';

import '../../widgets/background_widget/custom_background_widget.dart';

class EnterYourMobile extends StatefulWidget {
  const EnterYourMobile({super.key});

  @override
  _EnterYourMobileState createState() => _EnterYourMobileState();
}

class _EnterYourMobileState extends State<EnterYourMobile> {
  final FocusNode _focusNode = FocusNode();
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isButtonVisible = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes the shadow
        leading: BackButton(),
      ),
      body: CustomBackgroundWidget(
        page: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Enter your mobile number",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Mobile Number",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff7C7C7C),
                ),
              ),
              SizedBox(height: 10),
              IntlPhoneField(
                focusNode: _focusNode, // Attach the focus node here
                showDropdownIcon: false,
                disableLengthCheck: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 12),
                  hintText: "    Enter your mobile number",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff303030),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                initialCountryCode: 'IN', // Correct parameter for initial country code
                onChanged: (phone) {
                  // Print the complete number or use it as needed
                  print(phone.completeNumber);
                },
              ),
              SizedBox(height: 20),
              if (_isButtonVisible)
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(()=>EnterYourCode());
                    },
                    child: CircleAvatar(
                      radius: 33.5,
                      backgroundColor: Color(0xff53B175),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
