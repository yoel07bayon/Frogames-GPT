import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_ia/app/app.dart';
import 'package:personal_ia/core/provider/chat_provider.dart';
import 'package:personal_ia/core/provider/theme_provider.dart';
import 'package:personal_ia/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: const App(),
    ),
  );
}
