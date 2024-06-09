import 'package:flutter/material.dart';
import 'package:green_alert/providers/data_provider.dart';
import 'package:green_alert/providers/page_provider.dart';
import 'package:green_alert/pages/splash_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://zohwotklgcwnxhrvjdbc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpvaHdvdGtsZ2N3bnhocnZqZGJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTc0MzA3MDYsImV4cCI6MjAzMzAwNjcwNn0.qjhyxaCesSBL4QU-SOaSbhCJX-iWG3mwGv4zNOCYlrk',
  );
  initializeDateFormatting('id_ID', "").then((_) => runApp(const MyApp()));
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageProvider()),
        ChangeNotifierProvider(create: (context) => DataProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
