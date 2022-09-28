import 'dart:async';
import 'package:quiz_u/library.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProfileScreen> {
////////////////! variables !////////////////
  UserModel? userProfile;
  bool isloading = false;
  List<String> scores = [];
////////////////! variables !////////////////

  Future getData() async {
    if (mounted) {
      setState(() => isloading = true);
    }
    userProfile = await ProfileServices.getUserInfo();
    if (mounted) {
      setState(() => isloading = false);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = Prefs.getData(key: "mobile");
    print(key);
    scores = prefs.getStringList(key) ?? [];
  }

  @override
  void initState() {
    if (mounted) {
      getData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isloading
          ? const Center(child: CustomLoading())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20 + 20, right: 20, bottom: 20),
                          margin: const EdgeInsets.only(top: 45),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppBrand.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                userProfile!.name!,
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                userProfile!.mobile!,
                                style: const TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: AppBrand.backgroundColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: Get.height * 0.13,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/scoreicon.svg",
                                                height: 25,
                                                color: AppBrand.whiteColor,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Text(
                                                  "SCORE",
                                                  style: TextStyle(
                                                      color: Color(0xffb4aaf6),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ),
                                              const Text(
                                                "200",
                                                style: TextStyle(
                                                    color: AppBrand.whiteColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/icons/world.svg",
                                                  height: 25,
                                                  color: AppBrand.whiteColor),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Text(
                                                  "WORLD RANK",
                                                  style: TextStyle(
                                                      color: Color(0xffb4aaf6),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ),
                                              const Text(
                                                "#1973",
                                                style: TextStyle(
                                                    color: AppBrand.whiteColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/local.svg",
                                                height: 25,
                                                color: AppBrand.whiteColor,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Text(
                                                  "LOCAL RANK",
                                                  style: TextStyle(
                                                      color: Color(0xffb4aaf6),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ),
                                              const Text(
                                                "#75",
                                                style: TextStyle(
                                                    color: AppBrand.whiteColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: const Color(0xffe9e5fb),
                                    //color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: Get.height * 0.355,
                                  width: double.infinity,
                                  child: Column(
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "My Scores",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            SvgPicture.asset(
                                                "assets/icons/recentm.svg",
                                                height: 30,
                                                width: 30),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.25,
                                        width: double.infinity,
                                        child: ListView.builder(
                                          itemCount: scores.length,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (
                                            BuildContext context,
                                            int index,
                                          ) {
                                            String score = scores[index];
                                            List singelScore = score.split('|');
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 13),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    singelScore[1] +
                                                        " " +
                                                        singelScore[0],
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "Scores: ${singelScore[2]} ",
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 10,
                          right: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 45,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(45)),
                              child: SvgPicture.asset(
                                  "assets/icons/profileH.svg",
                                  height: 200,
                                  width: 200),
                              //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
