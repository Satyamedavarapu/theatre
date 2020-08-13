import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theatre/providers/visibility_provider.dart';
import 'package:theatre/screens/authentication/sign_up.dart';
import 'package:theatre/screens/home/home_screen.dart';
import 'package:theatre/utils/fade_animation.dart';
import 'package:theatre/utils/utilStyles.dart';
import 'package:theatre/utils/util_colors.dart';
import 'package:theatre/utils/util_widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UtilWidgets uWids = UtilWidgets();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var visibleInfo = Provider.of<TextVisibility>(context, listen: false);

    print('Page build');
    return Scaffold(
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
                          text: 'Welcome back to ',
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
                buildPasswordField(
                    fieldName: 'Password',
                    controller: passwordController,
                    action: TextInputAction.send,
                    focus: (val) => FocusScope.of(context).nextFocus(),
                    textType: TextInputType.text,
                    validator: (val) {
                      if (val.isEmpty == true) {
                        return 'Password cannot be empty';
                      } else
                        return null;
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FadeAnimation(
                3.0,
                InkWell(
                  onTap: () {},
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: UtilStyles.generalText,
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 24.0, right: 24.0, top: 24.0, bottom: 16.0),
              child: FadeAnimation(
                3.0,
                uWids.gradientButton(
                    buttonName: 'Login',
                    onTap: pushHome,
                    style: UtilStyles.buttonText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: FadeAnimation(
                4.0,
                InkWell(
                  onTap: pushSignUp,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Don\'t have a ticket? Create one',
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
          child: Consumer<TextVisibility>(
            builder: (context, data, child) {
              return TextFormField(
                obscureText: data.isVisible,
                controller: controller,
                keyboardType: textType,
                textInputAction: action,
                onFieldSubmitted: focus,
                validator: validator,
                style: UtilStyles.generalText,
                decoration: InputDecoration(
                  suffixIcon: Consumer<TextVisibility>(
                    builder: (context, data, child) {
                      return IconButton(
                        onPressed: () {
                          data.setDisplayText(!data.isVisible);
                        },
                        icon: Icon(
                          data.isVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      );
                    },
                  ),
                  labelStyle: UtilStyles.generalText,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void pushSignUp() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignUpScreen()));
  }

  void pushHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
