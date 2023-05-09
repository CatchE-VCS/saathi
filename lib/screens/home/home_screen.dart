import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:saathi/controllers/botController.dart';
import 'package:saathi/controllers/likesController.dart';
import 'package:saathi/controllers/postController.dart';
import 'package:saathi/models/user_post_model.dart';
import 'package:saathi/screens/hope/hope_screen.dart';
import 'package:saathi/screens/post/post_screen.dart';
import 'package:saathi/screens/profile/profile_screen.dart';
import 'package:saathi/screens/widgets/drawer.dart';
import 'package:saathi/utils/colors.dart';
import 'package:saathi/utils/data.dart';
import 'package:saathi/widgets/custom_buttons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../models/onboarding_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    HomeScreen(),
    Quotes(),
    Scaffold(),
    OnBoardingPage(),
    MyProfile(),
  ];
  final _pc = PanelController();
  List<PostModel> _post = Data.postList;
  bool _showAppNavBar = true;
  late ScrollController _scrollController;
  bool _isScrollDown = false;
  int like = 0;
  int likes = 0;
  int _selectedindex = 0;

  void getAllPosts() async {
    _post = await Post().getData();
  }

  int _oldindex = 0;

  List ghhh = [
    "Positivity Wall",
    "Hope Chamber",
    "Add Post",
    "Meditation Dome",
    "Profile"
  ];

  @override
  void initState() {
    getAllPosts();
    super.initState();
    _scrollController = ScrollController();
    _initialScroll();
  }

  void _initialScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollDown) {
          _isScrollDown = true;
          _hideAppNavBar();
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollDown) {
          _isScrollDown = false;
          _showAppNvBar();
          setState(() {});
        }
      }
    });
  }

  final user = FirebaseAuth.instance.currentUser;
  getLikes(String id) async {
    var like = await LikesController().getLikes(id);

    likes = like.likes!;
    print(likes);
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height - 100,
      controller: _pc,
      panel: PostWidget(_pc),
      body: SafeArea(
        child: Scaffold(
          drawer: appdrawer(context),
          appBar: AppBar(
            centerTitle: true,
            title: Text(ghhh[_selectedindex]),
            backgroundColor: Colors.indigo[400],
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10))),
          ),
          extendBody: true,
          body: (_selectedindex == 0)
              ? ResponsiveBuilder(builder:
                  (BuildContext context, SizingInformation sizingInformation) {
                  return Container(
                    color: Colors.black12,
                    child: Column(
                      children: [
                        _listPostWidget(sizingInformation),
                      ],
                    ),
                  );
                })
              : _selectedindex == 2
                  ? _pages[_oldindex]
                  : _pages[_selectedindex],
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Icon(Icons.chat)),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontSize: 11),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedIconTheme: IconThemeData(
              color: Colors.black87,
            ),
            currentIndex: _selectedindex,
            onTap: (index) {
              setState(() {
                _selectedindex = index;
              });
              if (index == 2) {
                _pc.open();
              }
              if (index != 2) {
                _oldindex = index;
              }
            },
            iconSize: 27,
            selectedItemColor: Colors.black87,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: "Home",
                  activeIcon: Icon(
                    Icons.home_filled,
                    color: Colors.black87,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble),
                  label: "Hope Chamber",
                  activeIcon: Icon(
                    Icons.chat_bubble,
                    color: Colors.black87,
                  )),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined),
                label: "",
                activeIcon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.black87,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.holiday_village),
                label: "Meditation",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle_outlined),
                  label: "Profile",
                  activeIcon: Icon(
                    Icons.circle_outlined,
                    color: Colors.black87,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listPostWidget(SizingInformation sizingInformation) {
    return Expanded(
        child: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: RefreshIndicator(
        onRefresh: () async {
          getAllPosts();
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _post.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              margin: const EdgeInsets.only(bottom: 0.0, top: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.black54, width: 0.50),
                  bottom: BorderSide(color: Colors.black54, width: 0.50),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        // decoration: BoxDecoration(
                        //     // borderRadius: BorderRadius.all(Radius.circular(0)),
                        //     image: DecorationImage(
                        //
                        //         image: AssetImage(_post[index].profileUrl!))),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(_post[index].profileUrl!),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _post[index].name!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: sizingInformation.screenSize.width / 1.34,
                            child: Text(
                              _post[index].headline!,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black54),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    _post[index].description!,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    _post[index].tags!,
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: sizingInformation.screenSize.width,
                    child: Image.network(
                      _post[index].image!,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 150,
                          height: 150,
                          child: Image.asset("assets/loading.gif"),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              child: Image.asset('assets/icons/like_icon.png'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              likes.toString(),
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              _post[index].comments!,
                            ),
                            Text(" comments")
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 0.50,
                    color: Colors.black26,
                  ),
                  _rowButton(index),
                ],
              ),
            );
          },
        ),
      ),
    ));
  }

  void _hideAppNavBar() {
    setState(() {
      _showAppNavBar = false;
    });
  }

  void _showAppNvBar() {
    setState(() {
      _showAppNavBar = true;
    });
  }

  Widget _rowButton(int index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () async {
              await LikesController().addLike(user!.uid, _post[index].id!);
              setState(() {
                getLikes(_post[index].id!);
              });
              print(_post[index].id!);
            },
            child: rowSingleButton(
                color: Colors.black,
                name: "Up vote",
                iconImage: "assets/icons/like_icon_white.png",
                isHover: true),
          ),
          InkWell(
            onTap: () {},
            child: rowSingleButton(
                color: Colors.black,
                name: "Comment",
                iconImage: "assets/icons/comment_icon.png",
                isHover: false),
          ),
          InkWell(
            onTap: () {},
            child: rowSingleButton(
                color: Colors.black,
                name: "Share",
                iconImage: "assets/icons/share_icon.png",
                isHover: false),
          ),
        ],
      ),
    );
  }
}
