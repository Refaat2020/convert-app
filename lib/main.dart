import 'package:currencyconverter/feature/conver_currency_feature/domain/cubit/convert_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/database_services.dart';
import 'feature/conver_currency_feature/views/home_screen/home_screen.dart';
import 'locator.dart';

late ObjectBox objectbox;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  objectbox = await ObjectBox.init();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConvertCubit(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
