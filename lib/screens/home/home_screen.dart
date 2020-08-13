import 'package:flutter/material.dart';
import 'package:theatre/blocs/home_screen_bloc.dart';
import 'package:theatre/models/nav_bar_model.dart';
import 'package:theatre/screens/home/home_page.dart';
import 'package:theatre/screens/home/my_list_page.dart';
import 'package:theatre/screens/home/profile_page.dart';
import 'package:theatre/screens/home/search_page.dart';
import 'package:theatre/utils/util_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenBloc bloc = HomeScreenBloc.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: getBottomBar(),
    );
  }

  Widget buildBody() {
    return StreamBuilder<int>(
      stream: bloc.presentStream,
      initialData: 0,
      builder: (context, snapshot) {
        return Container(
          child: getPage(snapshot.data),
        );
      },
    );
  }

  Widget getBottomBar() {
    return StreamBuilder<int>(
      stream: bloc.getStream(),
      initialData: 0,
      builder: (context, snapshot) {
        return Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.black,
              splashColor: Colors.yellowAccent,
              unselectedWidgetColor: Colors.green,
              primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.grey))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white,
            fixedColor: UtilColors.appButton,
            showUnselectedLabels: true,
            currentIndex: snapshot.data,
            onTap: (int index) {
              bloc.onStreamChange(index);
            },
            items: items.map((BottomBarItems items) {
              return BottomNavigationBarItem(
                title: Text(items.name),
                icon: Icon(items.icon),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  List<BottomBarItems> items = [
    BottomBarItems('Home', 0, Icons.home),
    BottomBarItems('Search', 1, Icons.search),
    BottomBarItems('My List', 2, Icons.list),
    BottomBarItems('Profile', 3, Icons.account_box),
  ];

  Widget getPage(int page) {
    if (page == 0) {
      return HomePage();
    } else if (page == 1) {
      return SearchPage();
    } else if (page == 2) {
      return MyListPage();
    } else if (page == 3) {
      return ProfilePage();
    } else
      return null;
  }
}
