import 'package:quiz_u/library.dart';

class PinCodeScreen extends StatefulWidget {
  final String phone;
  const PinCodeScreen({required this.phone, Key? key}) : super(key: key);

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
////////////////! variables !////////////////
  bool again = false;
  bool isloading = false;
  int rem = 60;
  final pinCodeController = TextEditingController();
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
////////////////! variables !////////////////

  Future<void> checkCode() async {
    try {
      if (formKey.currentState!.validate()) {
        setState(() => isloading = !isloading);
        LoginModel? user = await AuthServices.login(
          phone: widget.phone,
          otp: pinCodeController.value.text.toEnglishDigit(),
        );
        if (user!.success!) {
          if (user.name == null) {
            await Get.off(() => const UpdateNameScreen());
          } else {
            setState(() => isloading = !isloading);
            await Get.to(() => const LayoutScreen());
            await Prefs.setData(key: "token", value: user.token);
          }
        } else {
          Get.snackbar("Erorr", user.message!,
              backgroundColor: Colors.red[300]);
          setState(() => isloading = false);
        }
      }
      // } else {
      //     Get.snackbar("Erorr", En,
      //         backgroundColor: Colors.red[300]);
      //     setState(() => isloading = false);
      //   }
    } catch (e) {
      setState(() => isloading = false);
    }
  }

  @override
  void dispose() {
    pinCodeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppBrand.backgroundColor,
      bottomNavigationBar:  Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * .08,
          vertical: context.height * .05,
        ),
                  child: isloading
                      ? const CustomLoading()
                      : DefaultButton(
                          onPress: (() => checkCode()), //signUp,
                          text: "Check",
                          font: 30,
                          height: 65,
                          width: double.infinity,
                          textColor: Colors.white,
                        ),
                ),
      appBar: AppBar(
        backgroundColor:  AppBrand.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppBrand.mainColor,
            ),
            onPressed: () async {
              Get.back();
            }),
      ),
      body: SafeArea(
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
                  //! image
                  SvgPicture.asset(
                    "assets/icons/otp_icon1.svg",
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
                      "Please enter the OTP sent to your mobile",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  //!Spacer
                  SizedBox(
                    height: context.height * 0.03,
                  ),
          
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                    //  closeKeyboardWhenCompleted: true,
                    //  errorText: "nawaf",
                   // forceErrorState: false,
                      controller: pinCodeController,
                      pinAnimationType: PinAnimationType.scale,
                      separator: const SizedBox(width: 28),
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.length != 4) {
                          return "Incomplete OTP";
                        }   return null;
                      },
                    ),
                  ),
                
                 
                 
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
