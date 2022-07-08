import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

final Map<String, Widget> _deviceIcons = {
  'smoke_detector': SvgPicture.asset('assets/SDCO.svg'),
  'water_leak_detector': SvgPicture.asset('assets/SDCO.svg'),
  'stairs': SvgPicture.asset('assets/stairs.svg')
};

Widget getDeviceIcon(String iconName) {
  return _deviceIcons[iconName] ?? const Icon(Icons.close);
}