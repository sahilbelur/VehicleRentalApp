import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/resources/custom_color.dart';
import 'modules/user_details/name_screen.dart';
import 'modules/view_model/booking_view_model.dart';


void main() {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BookingViewModel()),
        ],
        child: const MyApp(),
      ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle Rental App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColor.primaryColor),
      ),
      home: NameScreen(),
    );
  }
}
