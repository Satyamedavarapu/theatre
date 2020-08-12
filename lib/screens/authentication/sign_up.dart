import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theatre/screens/authentication/login.dart';
import 'package:theatre/screens/home/home_screen.dart';
import 'package:theatre/utils/fade_animation.dart';
import 'package:theatre/utils/utilStyles.dart';
import 'package:theatre/utils/util_colors.dart';
import 'package:theatre/utils/util_widgets.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  UtilWidgets uWids = UtilWidgets();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPassword = false;
  bool isConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    print('Page build');
    return Scaffold(
      backgroundColor: UtilColors.appBackground,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 64.0),
                  child: FadeAnimation(
                    1.0,
                    Container(
                      height: height / 10 * 3,
                      width: width / 10 * 7,
                      decoration: BoxDecoration(
                          color: UtilColors.appButton,
                          borderRadius: BorderRadius.circular(45.0),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://img.freepik.com/free-vector/theater-stage-with-red-velvet-open_1284-12643.jpg?size=626&ext=jpg'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: FadeAnimation(
                    1.5,
                    RichText(
                      text: TextSpan(
                          text: 'Welcome to ',
                          style: UtilStyles.generalText,
                          children: <TextSpan>[
                            TextSpan(
                                text: '${'Theatre'}',
                                style: UtilStyles.richTextStyle)
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FadeAnimation(
                2.0,
                uWids.buildField(
                    fieldName: 'UserName',
                    fieldController: nameController,
                    textType: TextInputType.text,
                    isObscure: false,
                    action: TextInputAction.next,
                    focus: (val) => FocusScope.of(context).nextFocus(),
                    validator: (val) {
                      if (val.isEmpty == true) {
                        return 'Field cannot be empty';
                      } else if (val.length <= 3) {
                        return 'Email should contain more than 3 characters';
                      } else
                        return null;
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FadeAnimation(
                2.0,
                uWids.buildField(
                    fieldName: 'Email',
                    fieldController: emailController,
                    textType: TextInputType.emailAddress,
                    isObscure: false,
                    action: TextInputAction.next,
                    focus: (val) => FocusScope.of(context).nextFocus(),
                    validator: (val) {
                      if (val.isEmpty == true) {
                        return 'Field cannot be empty';
                      } else if (val.length <= 3) {
                        return 'Email should contain more than 3 characters';
                      } else
                        return null;
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FadeAnimation(
                2.0,
                uWids.buildField(
                    fieldName: 'Contact',
                    fieldController: numberController,
                    textType: TextInputType.number,
                    isObscure: false,
                    action: TextInputAction.next,
                    focus: (val) => FocusScope.of(context).nextFocus(),
                    validator: (val) {
                      if (val.isEmpty == true) {
                        return 'Field cannot be empty';
                      } else if (val.length != 10) {
                        return 'Email should contain more than 3 characters';
                      } else
                        return null;
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FadeAnimation(
                2.0,
                buildPasswordField(
                    fieldName: 'Password',
                    controller: passwordController,
                    action: TextInputAction.send,
                    focus: (val) => FocusScope.of(context).nextFocus(),
                    textType: TextInputType.text,
                    isVisible: isPassword,
                    icon: IconButton(
                      icon: Icon(
                        isPassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                    ),
                    validator: (val) {
                      if (val.isEmpty == true) {
                        return 'Password cannot be empty';
                      } else
                        return null;
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FadeAnimation(
                2.0,
                buildPasswordField(
                    fieldName: 'Confirm Password',
                    controller: confirmPasswordController,
                    action: TextInputAction.send,
                    focus: (val) => FocusScope.of(context).nextFocus(),
                    textType: TextInputType.text,
                    isVisible: isConfirmPassword,
                    icon: IconButton(
                      icon: Icon(
                        isConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPassword = !isConfirmPassword;
                        });
                      },
                    ),
                    validator: (val) {
                      if (val.isEmpty == true) {
                        return 'Password cannot be empty';
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        return 'Passwords did not match';
                      } else
                        return null;
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 24.0, right: 24.0, top: 24.0, bottom: 16.0),
              child: FadeAnimation(
                3.0,
                uWids.gradientButton(
                    buttonName: 'Sign Up',
                    onTap: pushHome,
                    style: UtilStyles.buttonText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: FadeAnimation(
                4.0,
                InkWell(
                  onTap: pushLogin,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Already have a ticket? Login now',
                        style: UtilStyles.generalText,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPasswordField({
    @required TextEditingController controller,
    @required String fieldName,
    TextInputType textType,
    TextInputAction action,
    Function focus,
    Function validator,
    bool isVisible,
    IconButton icon,
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
              obscureText: isVisible,
              controller: controller,
              keyboardType: textType,
              textInputAction: action,
              onFieldSubmitted: focus,
              validator: validator,
              style: UtilStyles.generalText,
              decoration: InputDecoration(
                suffixIcon: icon,
                labelStyle: UtilStyles.generalText,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ))
      ],
    );
  }

  void pushLogin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void pushHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
