import 'package:flutter/material.dart';
import 'package:getx_test/app/util/util.dart';

extension InkWellExtensions on Widget {
  Widget regularInkWell({Function? onTap}) {
    return InkWell(
        onTap: () => onTap!(),
        borderRadius: BorderRadius.all(Radius.circular(10.width())),
        child: this);
  }
}
