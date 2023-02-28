import 'package:flutter/material.dart';

const server = "http://fhunt-env.eba-pr2amuxm.ap-southeast-1.elasticbeanstalk.com/api/v1/";

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const cCustomMainColor= Color(0xFF00B1FF);
const cCustomMainColor2= Color(0xFF1939FF);

MaterialColor mCustomMainColor = MaterialColor(
  0xFF00B1FF,
  <int, Color>{
    50: Color(0xFFE1F5FE),
    100: Color(0xFFB3E5FC),
    200: Color(0xFF81D4FA),
    300: Color(0xFF4FC3F7),
    400: Color(0xFF29B6F6),
    500: cCustomMainColor,
    600: Color(0xFF039BE5),
    700: Color(0xFF0288D1),
    800: Color(0xFF0277BD),
    900: Color(0xFF01579B),
  },
);


const kDefaultPadding = 20.0;