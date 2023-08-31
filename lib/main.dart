import 'package:credit_card_recommendation_system/constants/colors.dart';
import 'package:credit_card_recommendation_system/screens/home_page.dart';
import 'package:credit_card_recommendation_system/utils/providers/carousel_provider.dart';
import 'package:credit_card_recommendation_system/utils/providers/questions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuestionsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarouselProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Credit Card Recommendation System',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.transparent,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          iconTheme: const IconThemeData(
            color: kIconColor,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: kPrimaryColor,
          ),
          listTileTheme: const ListTileThemeData(
            contentPadding: EdgeInsets.all(0),
            iconColor: kIconColor,
            textColor: kPrimaryColor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor: kButtonColor,
              foregroundColor: Colors.white,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kButtonColor,
              foregroundColor: Colors.white,
            ),
          ),
        ),
        home: const HomePage(),
        routes: {
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
