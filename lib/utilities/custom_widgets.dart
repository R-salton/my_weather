import 'package:flutter/material.dart';
import 'package:my_weather/utilities/constants.dart';

class TopMenu extends StatelessWidget {
  TopMenu(
      {super.key,
      this.leftIcon,
      this.rightIcon,
      this.title,
      this.iconColors,
      required this.onClick});

  String? leftIcon = "assets/icons/menu1.png";
  Icon? rightIcon = const Icon(Icons.refresh);
  String? title = "";
  Color? iconColors = kDarkContainerColor;
  final void Function() onClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              onClick(); // Call the onClick function if it's not null
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: iconColors,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image(
                  image: AssetImage("$leftIcon"),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            "$title",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: iconColors,
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                Padding(padding: const EdgeInsets.all(5.0), child: rightIcon),
          ),
        ],
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  MyContainer(
      {super.key,
      this.height,
      this.width,
      this.bgColor,
      this.child,
      this.paddingTop,
      left,
      right});

  double? height = 0;
  double? width = 0;
  Color? bgColor = const Color(0x00ffffff);
  Widget? child;
  double left = 15.0;
  double right = 15.0;
  double? paddingTop;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
          padding: EdgeInsets.only(
              left: left, right: right, top: paddingTop ?? 25.0),
          child: child),
    );
  }
}

class weatherWithImage extends StatelessWidget {
  weatherWithImage({super.key, this.imageUrl, this.comment, this.data});

  String? imageUrl = '';
  String? comment = '';
  String? data = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        children: [
          Image(
            height: 40,
            image: AssetImage(imageUrl.toString()),
          ),
          Text(
            "$data",
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "$comment",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
