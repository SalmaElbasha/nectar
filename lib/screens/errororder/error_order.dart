import 'package:flutter/material.dart';
import 'dart:ui'; // For BackdropFilter

import '../widgets/custombottom/custom_button.dart';

class ErrorOrder extends StatelessWidget {
  const ErrorOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0), // Semi-transparent overlay
            ),
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                _showMyDialog(context);
              },
              child: Text('Show Alert'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: true, // Allow dismissing by tapping outside
      barrierLabel: 'Dismiss',
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset('assets/images/image 13.png'),
                  SizedBox(height: 16.0),
                  Column(
                    children: [
                      Text(
                        'Oops! Order Failed',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Something went terribly wrong.',
                        style: TextStyle(
                          color: Color(0xff7C7C7C),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                Column(
                  children: [
                    CustomButton(
                      onPressed: () {},
                      text: 'Please Try Again',
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {},
                      child: Text(
                        "Back to home",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
