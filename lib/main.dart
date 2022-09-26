
import 'library.dart';


void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  
 await Prefs.init();
  runApp(const MyApp());
}
   


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
     bool isLogin = Prefs.containsToken(key: 'token') ?? false;
    return GetMaterialApp(
  debugShowCheckedModeBanner: false,
     theme: ThemeData(
        fontFamily: "Cairo",
        
      ),
      home: 
    isLogin? const LayoutScreen() :  const SignInScreen(),
    );
  }
}


  

