import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/util/extension/sizedbox_extension.dart';

import '../util.dart';

class RegularTextFiled extends StatelessWidget {
  const RegularTextFiled({
    Key? key,
    required this.textC,
    this.isObscure = false,
    this.isPassword = false,
    this.isOnlyNumber = false,
    this.isEnable = true,
    this.onTapObscure,
    required this.hint,
    this.onTextChange,
    this.errorText,
    this.customIcon,
    this.regularNumber = false,
    this.isShowIdleBorder,
    this.isShowSearchIcon,
    this.isCurrencyFormat,
    this.isWeight = false,
    this.onTap,
    this.maxLine,
    this.fieldHeight,
    this.onComplete,
    this.focusNode,
    this.errorBorder,
    this.roundedRadius,
  }) : super(key: key);

  final TextEditingController textC;
  final bool isObscure;
  final bool isPassword;
  final bool isOnlyNumber;
  final Function? onTapObscure;
  final Function? onTextChange;
  final String hint;
  final bool isEnable;
  final String? errorText;
  final Widget? customIcon;
  final bool regularNumber;
  final bool? isShowIdleBorder;
  final bool? isShowSearchIcon;
  final bool? isCurrencyFormat;
  final bool isWeight;
  final Function? onTap;
  final int? maxLine;
  final double? fieldHeight;
  final Function? onComplete;
  final FocusNode? focusNode;
  final Color? errorBorder;
  final double? roundedRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: fieldHeight,
          child: TextFormField(
            onTap: () {
              if (onTap != null) {
                onTap!();
              } else {
                null;
              }
            },
            onEditingComplete: () {
              if (onComplete != null) {
                onComplete!();
              } else {
                null;
              }
            },
            textAlignVertical: TextAlignVertical.center,
            controller: textC
              ..selection = TextSelection.fromPosition(TextPosition(offset: 0)),
            readOnly: !isEnable,
            obscureText: isObscure,
            keyboardType: isOnlyNumber
                ? TextInputType.numberWithOptions(signed: true, decimal: true)
                : isCurrencyFormat ?? false
                    ? const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      )
                    : TextInputType.text,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.singleLineFormatter,
            ],
            onChanged: (val) {
              if (onTextChange != null) {
                onTextChange!(val);
              }
            },
            cursorColor: Colors.green,
            maxLines: maxLine ?? 1,
            focusNode: focusNode,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical:
                        fieldHeight == 42.width() ? 12.width() : 14.width(),
                    horizontal: 12.width()),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: isEnable ? Colors.green : Colors.grey,
                      width: isEnable ? 2 : 1.width()),
                  borderRadius:
                      BorderRadius.circular(roundedRadius ?? 7.width()),
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(roundedRadius ?? 7.width()),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(roundedRadius ?? 7.width()),
                  borderSide: BorderSide(
                      color: isShowIdleBorder ?? true
                          ? Colors.grey
                          : Colors.transparent,
                      width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(roundedRadius ?? 7.width()),
                  borderSide:
                      BorderSide(color: errorBorder ?? Colors.red, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(roundedRadius ?? 7.width()),
                  borderSide:
                      BorderSide(color: errorBorder ?? Colors.red, width: 1.0),
                ),
                hintText: hint,
                prefixText: '',
                focusColor: Colors.green,
                filled: true,
                // fillColor: themeC.secondaryBackground.value,
                hoverColor: Colors.green,
                iconColor: Colors.green,
                errorText: errorText,
                errorStyle: TextStyle(fontSize: 0, height: -100),
                suffixIcon: customIcon ??
                    (isPassword
                        ? IconButton(
                            icon: SvgPicture.asset(
                              isObscure
                                  ? "assets/icons/ic_pass_close.svg"
                                  : "assets/icons/ic_pass_open.svg",
                            ),
                            onPressed: () {
                              onTapObscure!();
                            })
                        : customIcon)),
          ),
        ),
        if (errorText != null && errorText != "")
          Column(
            children: [
              6.verticalSpace(),
              errorText.text(
                  TextStyle().copyWith(letterSpacing: -0.5, height: 0),
                  color: Colors.red),
            ],
          )
      ],
    );
  }
}
