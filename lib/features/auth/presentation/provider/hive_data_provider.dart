import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/model/debitcard.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/model/expenses.dart';

final userBoxProvider = Provider<Box>((ref) {
  return Hive.box('userBox');
});

final expensesBoxProvider = Provider<Box<Expense>>((ref) {
  return Hive.box<Expense>('expensesBox');
});

final expensesListProvider = StreamProvider<List<Expense>>((ref) {
  final box = Hive.box<Expense>('expensesBox');
  return box.watch().map((event) => box.values.toList());
});

// final debitCardBoxProvider = Provider<Box<DebitCard>>((ref) {
//   return Hive.box<DebitCard>('debitcardBox');
// });

// final debitCardListProvider = StreamProvider<List<DebitCard>>((ref) {
//   final box = Hive.box<DebitCard>('debitcardBox');
//   return box.watch().map((event) => box.values.toList());
// });

final cardBoxProvider = Provider<Box<DebitCard>>((ref) {
  return Hive.box<DebitCard>('debitcardBox');
});