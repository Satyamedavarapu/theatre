import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theatre/utils/utilStyles.dart';
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

  Widget buildField({
    @required String fieldName,
    @required TextEditingController fieldController,
    TextInputType textType,
    bool isObscure,
    TextInputAction action,
    Function focus,
    Function validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: UtilStyles.generalText,
        ),
        Container(
          height: 56.0,
          child: TextFormField(
            style: UtilStyles.generalText,
            obscureText: isObscure,
            keyboardType: textType,
            textInputAction: action,
            onFieldSubmitted: focus,
            validator: validator,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
          ),
        ),
      ],
    );
  }
}
