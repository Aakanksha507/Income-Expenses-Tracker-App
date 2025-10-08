import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/homepage/homepage.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/onboarding/onboarding.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/splash/splash_page.dart';

final GoRouter router = GoRouter(
  initialLocation: Path.splash,
  routes: [
    GoRoute(path: Path.splash, builder: (context, state) => const SplashPage()),
    GoRoute(
      path: Path.onBoarding,
      builder: (context, state) => const Onboarding(),
    ),
    GoRoute(path: Path.homepage, builder: (context, state) => const Homepage()),
  ],
);
