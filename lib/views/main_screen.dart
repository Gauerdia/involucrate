import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:involucrate/util/dialogs.dart';
import 'package:involucrate/views/calendar/calendar_screen.dart';
import 'package:involucrate/views/create_new/create_project.dart';
import 'package:involucrate/views/discussion_feed/discussion_feed_screen.dart';
import 'package:involucrate/views/project_feed/project_feed_screen.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:involucrate/views/profile/profile_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>  {

  var _pageController = PageController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  int _page = 0;

  List drawerItems = [
    {"icon": Icons.add,"name": "Feed",},
    {"icon": Icons.delete, "name": "Your Feed",},
    {"icon": Icons.delete, "name": "test1",},
    {"icon": Icons.delete, "name": "test2",},
    {"icon": Icons.delete, "name": "test3",},
  ];

  @override
  Widget build(BuildContext context) {

    // WillPopScope: Makes sure, the user does not leave the app accidentally
    return WillPopScope(
      onWillPop: () => Dialogs().showExitDialog(context),
      child: Scaffold(
        body: _buildPageView(),
        bottomNavigationBar: _buildBottomNavigation(),
        //drawer: _buildDrawer(),
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
        DiscussionFeedScreen(),
        CreateProjectScreen(),
        CalendarScreen(),
        ProfileScreen()
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
    setState(() {
      _page = page;
    });
  }

  BottomNavigationBar _buildBottomNavigation(){
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: Colors.grey[500],
      elevation: 20,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            FeatherIcons.home,
          ),
          label: "Projects"
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FeatherIcons.compass,
          ),
          label: "Discussions"
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FeatherIcons.settings,
          ),
          label: "Create New"
        ),
        BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.settings,
            ),
            label: "Calendar"
        ),
        BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.settings,
            ),
            label: "Profile"
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
              physics: const NeverScrollableScrollPhysics(),
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
        /*
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShowProjectScreen())
        );
         */
      },
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Explore',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32.0),
                      ),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite_border),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32.0),
                      ),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(FontAwesomeIcons.mapMarkerAlt),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
