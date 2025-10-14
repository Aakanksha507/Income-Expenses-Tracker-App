import 'package:hive/hive.dart';

part 'expenses.g.dart';

@HiveType(typeId: 1)
class Expense extends HiveObject {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String category;

  @HiveField(2)
  final String amount;

  @HiveField(3)
  final String date;
  
  @HiveField(4)
final String? categoryImage;


  Expense( {
    required this.userId,
    required this.category,
    required this.amount,
    required this.date,
    required this.categoryImage,
  });
}
