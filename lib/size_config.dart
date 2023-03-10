import 'package:flutter/material.dart';

class SizeConfig {
  MediaQueryData _mediaQueryData;
  double screenwidth;
  double screenheight;
  double defautsize;
  Orientation orientation;

  SizeConfig(this._mediaQueryData, this.defautsize, this.screenheight,
      this.screenwidth, this.orientation);

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenwidth = _mediaQueryData.size.width;
    screenheight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

  double getProportionateScreenwidth(double inputWidth) {
    double screenWidth = screenwidth;
    return (inputWidth / 812) * screenWidth;
  }
  double getProportionateScreenheight(double inputHieght) {
  double screenHeight = screenheight;
  return (inputHieght / 812) * screenHeight;
}
}


