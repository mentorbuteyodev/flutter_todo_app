import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todays_plan_2/model/model.dart';
import 'package:todays_plan_2/screens/home.dart';
import 'package:todays_plan_2/services/hive_service_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();

  // register ToDoModel Adapter
  Hive.registerAdapter(
    ToDoModelAdapter(),
  );

  // register the adapter

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // to-do provider
        ChangeNotifierProvider(
          create: (context) => HiveServiceProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
