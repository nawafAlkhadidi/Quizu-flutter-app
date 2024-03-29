import 'package:quiz_u/library.dart';

class UpdateNameScreen extends StatefulWidget {
  const UpdateNameScreen({Key? key}) : super(key: key);

  @override
  State<UpdateNameScreen> createState() => _UpdateNameScreen();
}

class _UpdateNameScreen extends State<UpdateNameScreen>
    with WidgetsBindingObserver {
////////////////! variables !////////////////
  bool req = false;
  bool isloading = false;
  final nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
////////////////! variables !////////////////

  Future<void> update() async {
    if (formKey.currentState!.validate()) {
      setState(() => isloading = !isloading);
      req = await AuthServices.updateName(name: nameController.text);
      if (req) {
        setState(() => isloading = !isloading);
        await Get.offAll(() => const LayoutScreen());
      } else {
        Get.snackbar("Erorr", "", backgroundColor: Colors.red[300]);
        setState(() => isloading = false);
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  //! when the user close (pass) UpdateNameScreen and not complate update name will remove token ,
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        Navigator.of(context).pop();
        await Prefs.clearAllSharedPref();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppBrand.backgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * .08,
          vertical: context.height * .05,
        ),
        child: isloading
            ? const CustomLoading()
            : DefaultButton(
                onPress: update,
                text: "Done",
                font: 35,
                height: 65,
                width: double.infinity,
                textColor: AppBrand.whiteColor),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppBrand.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppBrand.secondColor,
            ),
            onPressed: () async {
              await Prefs.clearAllSharedPref();
              Get.offAll(() => const SignInScreen());
            }),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * .06,
                  vertical: context.height * .02,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //!image
                    SvgPicture.asset(
                      "assets/icons/name_icon.svg",
                      height: context.height * 0.3,
                      width: context.width * 0.6,
                    ),
                    //!Spacer
                    SizedBox(
                      height: context.height * 0.05,
                    ),
                    //!text
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        "What’s your name?",
                        style:
                            TextStyle(color: AppBrand.whiteColor, fontSize: 25),
                      ),
                    ),
                    //!Spacer
                    SizedBox(
                      height: context.height * 0.07,
                    ),
                    //!TextFiled
                    myTextFiled(
                      controller: nameController,
                      labelText: "",
                      suffixIcon: null,
                      hintText: "name",
                      validatorText: "Enter a valid name",
                      keyboardType: TextInputType.name,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
