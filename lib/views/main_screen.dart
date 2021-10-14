import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:involucrate/util/dialogs.dart';
import 'package:involucrate/views/co_working_space/co_working_space_screen.dart';
import 'package:involucrate/views/feed/feed_screen.dart';
import 'package:involucrate/views/feed/preferences_feed_screen.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:involucrate/views/project/show_project_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  var _pageController = PageController();
  int _page = 0;

  List drawerItems = [
    {"icon": Icons.add,"name": "Feed",},
    {"icon": Icons.delete, "name": "Your Feed",},
    {"icon": Icons.delete, "name": "333",},
    {"icon": Icons.delete, "name": "4444",},
    {"icon": Icons.delete, "name": "5555",},
  ];

  @override
  Widget build(BuildContext context) {
    // WillPopScope: Make sure, the user does not leave the app accidentally
    return WillPopScope(
      onWillPop: () => Dialogs().showExitDialog(context),
      child: Scaffold(
        body: _buildPageView(),
        bottomNavigationBar: _buildBottomNavigation(),
        drawer: _buildDrawer(),
      ),
    );
  }

  PageView _buildPageView(){
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: onPageChanged,
      children: const [
        FeedScreen(),
        PreferencesFeedScreen(),
        CoWorkingSpaceScreen(),
        ShowProjectScreen(),
        FeedScreen(),
        PreferencesFeedScreen()
      ],
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    print(page);
    setState(() {
      this._page = page;
    });
  }

  BottomNavigationBar _buildBottomNavigation(){
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Colors.grey[500],
      elevation: 20,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            FeatherIcons.home,
          ),
          label: "Feed"
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FeatherIcons.compass,
          ),
          label: "Your Feed"
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FeatherIcons.settings,
          ),
          label: "Feed"
        ),
      ],
      onTap: navigationTapped,
      currentIndex: _page,
    );
  }

  Drawer _buildDrawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
              child: const Center(
                child: Text("Header Area"),
              ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
            ),
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: drawerItems.length,
              itemBuilder: (BuildContext context, int index){
                Map item = drawerItems[index];
                return _buildDrawerListTile(item,index);
              })
        ],
      ),
    );
  }

  Widget _buildDrawerListTile(Map item, int index){
    return ListTile(
      leading: Icon(
        item['icon'],
        color: _page == index
          ?Theme.of(context).primaryColorLight
            : Theme.of(context).primaryColorDark
      ),
      title: Text(
        item["name"],
        style: TextStyle(
          color: _page == index
              ?Theme.of(context).primaryColorLight
              :Theme.of(context).primaryColorDark
        )
      ),
      onTap: (){
        print("Drawer clicked");
      },
    );
  }

}
