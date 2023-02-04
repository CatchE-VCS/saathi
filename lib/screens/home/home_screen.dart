import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:saathi/controllers/botController.dart';
import 'package:saathi/controllers/postController.dart';
import 'package:saathi/hope_screen.dart';
import 'package:saathi/models/user_post_model.dart';
import 'package:saathi/screens/post_screen.dart';
import 'package:saathi/screens/profile_screen.dart';
import 'package:saathi/utils/colors.dart';
import 'package:saathi/utils/data.dart';
import 'package:saathi/widgets/custom_app_bar.dart';
import 'package:saathi/widgets/custom_buttons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pc = PanelController();
  int currentIndex = 0;
  List<PostModel> _post = Data.postList;
  bool _showAppNavBar = true;
  late ScrollController _scrollController;
  bool _isScrollDown = false;
  int like = 0;
  int _selectedindex = 0;
  void getAllPosts() async {
    _post = await Post().getData();
  }

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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 0,
      maxHeight: 780,
      controller: _pc,
      panel: PostWidget(_pc),
      body: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: (currentIndex == 0)
              ? ResponsiveBuilder(builder:
                  (BuildContext context, SizingInformation sizingInformation) {
                  return Container(
                    color: Colors.black12,
                    child: Column(
                      children: [
                        _showAppNavBar
                            ? CustomAppBar(
                                sizingInformation: sizingInformation,
                              )
                            : Container(
                                height: 0.0,
                                width: 0.0,
                              ),
                        _listPostWidget(sizingInformation),
                      ],
                    ),
                  );
                })
              : const Scaffold(),
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
              if (index == 1) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quotes()));
              }
              if (index == 4) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyProfile()));
              }
              if (index == 2) {
                _pc.open();
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
                label: "",
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
                    bottom: BorderSide(color: Colors.black54, width: 0.50))),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.all(Radius.circular(0)),
                          image: DecorationImage(
                              image: AssetImage(_post[index].profileUrl!))),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _post[index].name!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: sizingInformation.screenSize.width / 1.34,
                          child: Text(
                            _post[index].headline!,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 14),
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

                      return const CircularProgressIndicator();
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
                          Container(
                            width: 25,
                            height: 25,
                            child:
                                Image.asset('assets/icons/celebrate_icon.png'),
                          ),
                          if (index == 0 || index == 4 || index == 6)
                            Container(
                              width: 25,
                              height: 25,
                              child: Image.asset('assets/icons/love_icon.png'),
                            ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            _post[index].likes!,
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
                _rowButton(),
              ],
            ),
          );
        },
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

  Widget _rowButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
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
