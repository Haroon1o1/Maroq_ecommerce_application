import 'package:flutter/material.dart';
import 'package:maroq_ecommerce_apparels/Providers/loadingProvider.dart';
import 'package:flutter/services.dart';
import 'package:maroq_ecommerce_apparels/Screens/SettingsScreens/cardAddingScreen/cardAdding.dart';
import 'package:maroq_ecommerce_apparels/Screens/SettingsScreens/shippingAddressScreen/shippingAddress.dart';
import 'package:maroq_ecommerce_apparels/Screens/SplashScreen.dart';

import 'package:maroq_ecommerce_apparels/navBar/mainNavBar.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LoadingProvider())],
      child: MaterialApp(debugShowCheckedModeBanner: false, title: 'Maroq', home: MainNavBar()),
    );
  }
}
