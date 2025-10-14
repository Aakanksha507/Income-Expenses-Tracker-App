import 'package:hive/hive.dart';

part 'debitcard.g.dart';

@HiveType(typeId: 2) // different typeId!
class DebitCard extends HiveObject {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String cardName;

  @HiveField(2)
  final String cardNumber;

  @HiveField(3)
  final String cvc;

  @HiveField(4)
  final String date;

  @HiveField(5)
  final String? zip;

  DebitCard({
    required this.userId,
    required this.cardName,
    required this.cardNumber,
    required this.cvc,
    required this.date,
    required this.zip,
  });
}
