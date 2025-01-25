import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/select_location/select_location_screen.dart';

import '../../widgets/background_widget/custom_background_widget.dart'; // Import GetX if you're using it for navigation

class EnterYourCode extends StatefulWidget {
  const EnterYourCode({super.key});

  @override
  _EnterYourCodeState createState() => _EnterYourCodeState();
}

class _EnterYourCodeState extends State<EnterYourCode> {
  final FocusNode _focusNode = FocusNode();
  bool _isButtonVisible = false;
  late Timer _timer;
  int _start = 20;
  bool _isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isButtonVisible = _focusNode.hasFocus;
      });
    });
    startTimer();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _isResendEnabled = false;
    _start = 20;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isResendEnabled = true;
        });
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
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
                  "Enter your 4-digit code",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Code",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff7C7C7C),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                focusNode: _focusNode,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 12),
                  hintText: "Code",
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
              ),
              SizedBox(height: 20),
              if (_isButtonVisible)
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(()=>SelectLocationScreen());
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
              SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _isResendEnabled ? startTimer : null,
                      child: Text(
                        "Resend Code",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: _isResendEnabled ? Color(0xff53B175) : Color(0xff7C7C7C),
                        ),
                      ),
                    ),
                    SizedBox(height: 5), // Add spacing between the text and the countdown
                    Text(
                      _start > 0 ? "$_start seconds" : "0 seconds",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff7C7C7C),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
