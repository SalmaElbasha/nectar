import 'package:flutter/material.dart';

import '../../widgets/background_widget/custom_background_widget.dart';
import '../widgets/custombottom/custom_button.dart';

class OrderAccepted extends StatelessWidget {
  const OrderAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomBackgroundWidget(
        page: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Center(
                child: Container(
                  width: 269.08,
                  height: 240.31,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/accepted.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "Your Order has been",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "accepted",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Your items has been placcd and is on",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "it’s way to being processed",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    CustomButton(onPressed: () {  }, text: 'Track Order',),
                  ],
                ),
                SizedBox(height: 10,),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: (){},
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
      ) ,
    );
  }
}
