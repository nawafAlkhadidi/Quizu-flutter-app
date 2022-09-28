import 'package:quiz_u/library.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen>
    with SingleTickerProviderStateMixin {
  //////////////! pages !////////////////
  final pages = [
    const HomeScreen(),
    const LeaderBoardSrceen(),
    const ProfileScreen(),
  ];
  //////////////! Appbar !////////////////
  final appBar = [
    "Home",
    "LeaderBoard",
    "Profile",
  ];
  late TabController _tabController;

  ////////////////! variables !////////////////

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  onTabIcon(index) async {
    _tabController.index = index;
    setState(() {});
  }

  void signOut() async {
    await Prefs.clearAllSharedPref();
    Get.offAll(() => const SignInScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBar[_tabController.index],
          style: const TextStyle(
              color: AppBrand.mainColor, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppBrand.backgroundColor,
        elevation: 0,
        leading: IconButton(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 5),
          onPressed: signOut,
          icon: SvgPicture.asset(
            "assets/icons/sign-out-alt.svg",
            color: AppBrand.mainColor,
            width: 20,
            height: 20,
          ),
        ),
      ),
      backgroundColor: AppBrand.backgroundColor,
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTab(
              title: 'Home',
              indexPage: 0,
              pathBlack: 'assets/icons/home1.svg',
              pathGray: 'assets/icons/home.svg',
              tab: onTabIcon,
              controller: _tabController,
            ),
            CustomTab(
              title: 'LeaderBoard',
              indexPage: 1,
              pathBlack: 'assets/icons/trophy1.svg',
              pathGray: 'assets/icons/trophy.svg',
              tab: onTabIcon,
              controller: _tabController,
            ),
            CustomTab(
              title: 'Profile',
              indexPage: 2,
              pathBlack: 'assets/icons/profile1.svg',
              pathGray: 'assets/icons/profile.svg',
              tab: onTabIcon,
              controller: _tabController,
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: TabBarView(
          controller: _tabController,
          children: pages,
        ),
      ),
    );
  }

  // return jsonDecode(result.data);

}
