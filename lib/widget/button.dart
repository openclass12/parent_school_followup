import 'package:flutter/material.dart';
import 'package:parent_school_followup/constant.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onPress;
  const DefaultButton({
    super.key, required this.title, required this.iconData, required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(
            left: kDefaultPadding, right: kDefaultPadding),
        padding: const EdgeInsets.only(right: kDefaultPadding),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        decoration: BoxDecoration(
            gradient: kPrimaryGradientColor,
            borderRadius: BorderRadius.circular(28)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children:  [
         const  Spacer(),
          Text(
            title,
            style:const TextStyle(color: kTexColor, fontSize: 26),
          ),
          const Spacer(),
          Icon(
            iconData,
            color: kTexColor,
            size: 26.0,
          ),
        ]),
      ),
    );
  }
}
