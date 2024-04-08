import 'package:flutter/material.dart';

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
          padding: EdgeInsets.only(left: left, right: right, top: paddingTop ?? 25.0),
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
