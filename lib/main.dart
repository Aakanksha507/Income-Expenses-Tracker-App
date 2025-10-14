import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:incomeexpensestracker/config/route/route.dart';
import 'package:incomeexpensestracker/config/theme/theme.dart';
import 'package:incomeexpensestracker/config/theme/theme_provider.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/model/expenses.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter(); // here hive is initialize

  Hive.registerAdapter(ExpenseAdapter());

  await Hive.openBox('userBox');
  await Hive.openBox<Expense>(
    'expensesBox',
  ); // this open the box to write and read data .

  runApp(
    ScreenUtilInit(
      designSize: Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) => const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final themeMode = ref.watch(themeModeProvider);
        return MaterialApp.router(
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}
