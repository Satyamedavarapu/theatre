import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theatre/utils/util_colors.dart';

class UtilWidgets {
  Widget gradientButton(
      {@required String buttonName,
      @required Function onTap,
      TextStyle style}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: UtilColors.appButton,
          borderRadius: BorderRadius.circular(30.0),
        ),
        height: 46.0,
        alignment: Alignment.center,
        child: Text(
          buttonName,
          style: style,
        ),
      ),
    );
  }
}
