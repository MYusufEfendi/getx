import 'package:flutter/cupertino.dart';
import 'package:getx_test/app/util/util.dart';

extension SizedBoxExtension on num {
  Widget horizontalSpace() {
    return SizedBox(
      width: width(),
    );
  }

  Widget verticalSpace() {
    return SizedBox(
      height: width(),
    );
  }
}