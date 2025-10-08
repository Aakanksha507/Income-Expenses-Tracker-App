import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(Path.onBoarding);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: 'mono',
              style: TextStyle(
                fontSize: 50,
                color: theme.textTheme.displayMedium!.color!,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 35.h),
            CircularProgressIndicator(
              color: theme.textTheme.displayMedium!.color!,
              strokeWidth: 1.5,
            ),
          ],
        ),
      ),

      backgroundColor: theme.primaryColor,
    );
  }
}
