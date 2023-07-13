import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/Home_Page.dart';

import 'modles/cheakerlist_model.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  var direvtory =await getApplicationDocumentsDirectory();
  Hive.init(direvtory.path);
  Hive.registerAdapter(listmodelAdapter());
  await Hive.openBox<listmodel>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home_page(),
    );
  }
}