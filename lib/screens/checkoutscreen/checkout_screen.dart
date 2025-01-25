import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/custombottom/custom_button.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomSheet Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 521,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Checkout',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            Icon(Icons.close),
                          ],
                        ),
                      ),
                      Divider(
                        color: Color(0xffE2E2E2),
                        thickness: 1.0,
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                print("22");
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Text(
                                        "Delivery",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Text(
                                            "Select Method",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
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
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xffE2E2E2),
                            thickness: 1.0,
                            indent: 16.0,
                            endIndent: 16.0,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                print("22");
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Text(
                                        "Payment",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Image.asset(
                                            'assets/images/card.png',
                                            width: 21, // Adjust the width as needed
                                            height: 16, // Adjust the height as needed
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
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xffE2E2E2),
                            thickness: 1.0,
                            indent: 16.0,
                            endIndent: 16.0,
                          ),
                        ],
                      )
                      ,Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                print("22");
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Text(
                                        "Promo Code",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Text(
                                            "Pick discount",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
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
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xffE2E2E2),
                            thickness: 1.0,
                            indent: 16.0,
                            endIndent: 16.0,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: () {
                                print("22");
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Text(
                                        "Total Cost",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Text(
                                            "\$13.97",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
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
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xffE2E2E2),
                            thickness: 1.0,
                            indent: 16.0,
                            endIndent: 16.0,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(

                          children: [
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "By placing an order you agree to our",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Terms",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () {
                                      },
                                    ),
                                    TextSpan(
                                      text: " and ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Conditions.",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () {
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: CustomButton(
                          onPressed: () {
                            // Handle place order action here
                          },
                          text: 'Place Order',
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Text('Show BottomSheet'),
        ),
      ),
    );
  }
}
