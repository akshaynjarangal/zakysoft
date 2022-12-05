import 'package:flutter/material.dart';
import '/mylibs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>CategoriesProvider()..getAllCategories()),
        ChangeNotifierProvider(create: (context)=> SelectedCategoryProvider()),
        ChangeNotifierProvider(create: (context)=> SubCategoriesProvider()),
        ChangeNotifierProvider(create: (context)=> SelectedSubCategoryProvider()),
        ChangeNotifierProvider(create: (context)=> ProductsProvider()),
      ],
      child: MaterialApp(
        title: 'Farawlah',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark
            ),
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black87,
              fontSize: 18
            ),
            iconTheme: IconThemeData(
              color: Colors.black87,
            ),
          actionsIconTheme: IconThemeData(
            color: Colors.black87
          )
          )
        ),
        routes: {
          '/products':(context) => Products()
        },
        initialRoute: '/products',
      ),
    );
  }
}

