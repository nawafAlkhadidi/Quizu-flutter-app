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
  PhoneNumber userNumber = PhoneNumber(isoCode: 'SA', phoneNumber: "966");
////////////////! variables !////////////////

  Future<void> loginIn() async {
    if (formKey.currentState!.validate()) {
      await Get.to(() => PinCodeScreen(
            phone: userNumber.phoneNumber!.toEnglishDigit().toString(),
          ));
    }
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
                  //!Spacer
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  //!Text
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Mobile",
                      style:
                          TextStyle(color: AppBrand.whiteColor, fontSize: 20),
                    ),
                  ),
                  //! PhoneNumberInput
                  Container(
                    height: 73,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white70),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InternationalPhoneNumberInput(
                        maxLength: 9,
                        onInputChanged: (PhoneNumber number) {
                          setState(() {
                            userNumber = number;
                          });
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        textStyle: const TextStyle(
                            color: AppBrand.blackColor, fontSize: 20),
                        validator: (p0) {
                          if (p0!.length > 9) {
                            return "More than 9 digits";
                          }
                          if (p0.length < 9) {
                            return "Less than 9 digits";
                          }
                          return null;
                        },
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
