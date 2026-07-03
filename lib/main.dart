import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

import 'package:provider/provider.dart';
import 'core/providers/subscription_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SubscriptionProvider()..loadSubscriptions()),
      ],
      child: const SubstrackerApp(),
    ),
  );
}

class SubstrackerApp extends StatelessWidget {
  const SubstrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Substracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}