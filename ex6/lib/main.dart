
import 'package:exo6/views/form.dart';
import 'package:exo6/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'views_model/click_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClickViewModel>(
        create: (context) => ClickViewModel(),
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: "/photos",
      routes: {
        "/photos" : (context) => HomeScreen(),
        "/addPhoto" : (context) => MyForm(),
      },
    ),
    );
  }
}

