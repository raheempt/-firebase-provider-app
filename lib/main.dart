import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_provider/controller/providerdb.dart';
import 'package:firebase_provider/firebase_options.dart';
import 'package:firebase_provider/view/HomePage.dart';
import 'package:firebase_provider/view/Listpage.dart';
import 'package:firebase_provider/view/notification.dart';
import 'package:firebase_provider/view/update.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalNotification.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>StudentId()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return snapshot.hasData ? ListPage() : HomePage();
            }
          },
        ),
        routes: {
          '/update': (context) => update(), 
          '/listpage': (context) => ListPage(), 
        },
      ),
    );
  }
}
