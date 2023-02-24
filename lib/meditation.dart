import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saathi/utils/app_color.dart';
import 'package:saathi/utils/app_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _feelingTitleList = [
    "Happy",
    "Angry",
    "Anxious",
    "Sleepy",
    "Sad",
    "Irritated"
  ];
  List<String> _feelingImgList = [
    AppImages.grinningPng,
    AppImages.angryPng,
    AppImages.anxiousPng,
    AppImages.sleepyPng,
    AppImages.cryingPng,
    AppImages.irritatedPng
  ];

  int selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: [
                _containerWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customPadding(
      {Widget? child,
      EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 30)}) {
    return Container(
      child: child,
      margin: margin,
    );
  }

  Widget _appBarWidget() {
    return customPadding(
      child: Row(
        children: [
          SvgPicture.asset(AppImages.menuSvg),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.borderGeyColors,
                  )),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search the best for you!",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _containerWidget() {
    return Expanded(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 30,
            ),
            customPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome Ray!",
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.primaryColors,
                    ),
                  ),
                  Image.asset(AppImages.user)
                ],
              ),
            ),
            customPadding(
              child: Text(
                "How are you feeling?",
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColors,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0),
                  itemCount: _feelingImgList.length,
                  itemBuilder: (context, index) {
                    return _feelingWidget(
                      image: _feelingImgList[index],
                      title: _feelingTitleList[index],
                    );
                  }),
            ),
            customPadding(
              child: Text(
                "Let's Explore",
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColors,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 180,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  _exploreWidget(
                      title: "Guided \nMeditation",
                      description: "16 Sessions",
                      bgImage: AppImages.bg3Png),
                  _exploreWidget(
                      title: "Relax\nand Sleep",
                      description: "24 Sessions",
                      bgImage: AppImages.bg2Png),
                  _exploreWidget(
                      title: "Focus\nEnhancement",
                      description: "21 Sessions",
                      bgImage: AppImages.bg1Png),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _exploreWidget(
      {required String title,
      required String description,
      required String bgImage}) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Stack(
        children: [
          Image.asset(bgImage),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primaryColors,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _feelingWidget({required String title, required String image}) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 60,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(color: AppColors.primaryColors, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _bottomMenuWidget() {
    return Container(
      child: Row(
        children: [
          _menuWidget(
            index: 0,
            menuIcon: AppImages.menu_home,
          ),
          _menuWidget(
            index: 1,
            menuIcon: AppImages.menu_disc,
          ),
          _menuWidget(
            index: 2,
            menuIcon: AppImages.menu_moon,
          ),
          _menuWidget(
            index: 3,
            menuIcon: AppImages.menu_music,
          ),
        ],
      ),
    );
  }

  Widget _menuWidget({required String menuIcon, required int index}) {
    bool isSelected = selectedMenu == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedMenu = index;
          });
        },
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                menuIcon,
                color: isSelected
                    ? AppColors.primaryColors
                    : AppColors.borderGeyColors,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 3,
                width: 15,
                color:
                    isSelected ? AppColors.primaryColors : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
