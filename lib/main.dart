import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_notes_player_app_setup/screens/Authentiction_Screens/screen/ForgetPassword.dart';
import 'package:music_notes_player_app_setup/screens/Authentiction_Screens/screen/LoginPage.dart';
import 'package:music_notes_player_app_setup/screens/Authentiction_Screens/screen/RegisterPage.dart';
import 'package:music_notes_player_app_setup/screens/Authentiction_Screens/screen/welcomPage.dart';
import 'package:music_notes_player_app_setup/screens/FavoriteScreen/favorite.dart';
import 'package:music_notes_player_app_setup/screens/HomeScrern/home_screen.dart';
import 'package:music_notes_player_app_setup/screens/ProfileScreens/profile.dart';
import 'const.dart';
import 'cubits/product_cupit/product_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  var box = await Hive.openBox(favoritBoxs);

  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    // Bloc.observer = SimpleBlocObserver();

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductCubit()..getproducts()),
        ],
        child: MaterialApp(
          routes: {
            RegisterPage.id: (context) => const RegisterPage(),
            LoginPage.id: (context) => const LoginPage(),
            WelcomePage.id: (context) => const WelcomePage(),
            ForgetPasswordPage.id: (context) => const ForgetPasswordPage(),
            HomeScreen.id: (context) => const HomeScreen(),
            ProfileScreen.id: (context) => const ProfileScreen(),
            FavoritesScreen.id: (context) => const FavoritesScreen(),
          },
          debugShowCheckedModeBanner: false,
          home: const WelcomePage(),
        ));
  }
}

//
// class GroceryApp extends StatelessWidget {
//   const GroceryApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(routes: {
//       RegisterPage.id: (context) => const RegisterPage(),
//       LoginPage.id: (context) => const LoginPage(),
//       WelcomePage.id: (context) => const WelcomePage(),
//       HomeScreen.id: (context) => const HomeScreen(),
//       ForgetPasswordPage.id: (context) => const ForgetPasswordPage(),
//     }, debugShowCheckedModeBanner: false, home: const WelcomePage());
//   }
// }
