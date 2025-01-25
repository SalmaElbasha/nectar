import 'package:flutter/material.dart';

class BeveragesWidget extends StatelessWidget {
  final String image;
  final int index;
  final String title;
  final String price;
  final String kilo;
  final Function() onTap;
  BeveragesWidget({required this.index, required this.title, required this.price, required this.kilo, required this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 5),
      width: 173.32,
      height: 248.51,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 16), // Adjust this value as needed to move the image down
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                image,
                width: 97.47,
                height: 85.09,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                maxLines: 1,
              ),

              SizedBox(height: 4),
              Text(
                kilo + "  quantity",
                style: TextStyle(
                  color: Color(0xff7C7C7C),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                price + "\$",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Color(0xff53B175),
                  ),
                  width: 45.67,
                  height: 45.67,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16.0),
                    onTap: onTap,
                    child: Center(
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
