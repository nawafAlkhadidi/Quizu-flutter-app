import 'package:quiz_u/library.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  ////////////////! variables !////////////////
  bool isloading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final logoinPhoneController = TextEditingController();
  PhoneNumber userNumber = PhoneNumber(isoCode: 'SA');
////////////////! variables !////////////////

  void loginIn() async {
    if (formKey.currentState!.validate()) {
      await Get.off(() => PinCodeScreen(
            phone: userNumber.phoneNumber!.toEnglishDigit().toString(),
          ));
    }
  }

  @override
  void dispose() {
    logoinPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * .08,
          vertical: context.height * .05,
        ),
        child: isloading
            ? const CustomLoading()
            : DefaultButton(
                onPress: loginIn,
                text: "Start",
                width: double.infinity,
                font: 35,
                height: 65,
                textColor: AppBrand.whiteColor,
              ),
      ),
      backgroundColor: AppBrand.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppBrand.backgroundColor,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * .08,
                vertical: context.height * .02,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: context.height * 0.2,
                      width: context.height * 0.2,
                      fit: BoxFit.contain,
                    ),
                  ),
                  //! text
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "QuizU",
                        style: TextStyle(
                            color: AppBrand.secondColor,
                            fontSize: 65,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  //!Text
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Mobile",
                      style:
                          TextStyle(color: AppBrand.whiteColor, fontSize: 23),
                    ),
                  ),
                  //! PhoneNumberInput
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InternationalPhoneNumberInput(
                        spaceBetweenSelectorAndTextField: 0,
                        maxLength: 9,
                        onInputChanged: (PhoneNumber number) {
                          userNumber = number;
                        },
                        selectorConfig: const SelectorConfig(
                          leadingPadding: 10,
                          trailingSpace: false,
                          setSelectorButtonAsPrefixIcon: false,
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        textStyle: const TextStyle(
                            color: AppBrand.blackColor, fontSize: 20),
                        selectorTextStyle: const TextStyle(
                            color: AppBrand.blackColor, fontSize: 20),
                        inputDecoration: const InputDecoration(
                          errorStyle: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide.none),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide.none),
                        ),
                        initialValue: userNumber,
                        textFieldController: logoinPhoneController,
                        formatInput: false,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 45),
                    child: Center(
                      child: Text(
                        "Developer by Nawaf Alkhadidi",
                        style: TextStyle(color: AppBrand.whiteColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
