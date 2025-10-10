import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/homepage/add_expense.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/homepage/homepage.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/onboarding/onboarding.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/profile/profile.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/splash/splash_page.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/statistics/statistics.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/wallet/bills/bill_details.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/wallet/bills/bill_payment.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/wallet/connect_wallet.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/wallet/wallet.dart';

final GoRouter router = GoRouter(
  initialLocation: Path.splash,
  routes: [
    GoRoute(path: Path.splash, builder: (context, state) => const SplashPage()),
    GoRoute(
      path: Path.onBoarding,
      builder: (context, state) => const Onboarding(),
    ),
    GoRoute(path: Path.homepage, builder: (context, state) => const Homepage()),
    GoRoute(
      path: Path.addexpense,
      builder: (context, state) => const AddExpense(),
    ),
    GoRoute(
      path: Path.statistics,
      builder: (context, state) => const Statistics(),
    ),
    GoRoute(path: Path.profile, builder: (context, state) => const Profile()),
    GoRoute(path: Path.wallet, builder: (context, state) => const Wallet()),
    GoRoute(
      path: Path.connect,
      builder: (context, state) => const ConnectWallet(),
    ),
    GoRoute(
      path: Path.billdetails,
      builder: (context, state) => const BillDetails(),
    ),
    GoRoute(
      path: Path.billpayment,
      builder: (context, state) => const BillPayment(),
    ),
  ],
);
