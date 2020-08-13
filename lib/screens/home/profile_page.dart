import 'package:flutter/material.dart';
import 'package:theatre/utils/fade_animation.dart';
import 'package:theatre/utils/utilStyles.dart';
import 'package:theatre/utils/util_colors.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        Container(
          height: screen.height / 10 * 0.5,
          color: Colors.transparent,
        ),
        FadeAnimation(
          1.5,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: screen.height / 10 * 2,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello',
                          style: UtilStyles.buttonText,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Surendra Dangeti',
                            style: UtilStyles.nameStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1522228115018-d838bcce5c3a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                      radius: 60.0,
                      backgroundColor: UtilColors.appButton,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          height: screen.height / 10 * 0.5,
          color: Colors.transparent,
        ),
        FadeAnimation(
          2.5,
          Container(
            height: screen.height / 10 * 6,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildProfileOption(
                    name: 'Change Password',
                    onTap: () {},
                    icon: Icons.visibility),
                buildProfileOption(
                    name: 'Contact Us',
                    onTap: () {},
                    icon: Icons.contact_phone),
                buildProfileOption(
                    name: 'About Us', onTap: () {}, icon: Icons.details),
                buildProfileOption(
                    name: 'Terms and Conditions',
                    onTap: () {},
                    icon: Icons.contact_mail),
                buildProfileOption(
                    name: 'Legal', onTap: () {}, icon: Icons.adjust),
                buildProfileOption(
                    name: 'Logout', onTap: () {}, icon: Icons.input),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget buildProfileOption(
      {@required String name,
      @required Function onTap,
      @required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: UtilStyles.profileOptionStyle,
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 18.0,
            )
          ],
        ),
      ),
    );
  }
}
