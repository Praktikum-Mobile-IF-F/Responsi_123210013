import 'package:hive/hive.dart';

part 'favourites.g.dart';

@HiveType(typeId: 0)
class Kopis {

  Kopis({
    required this.name,
    required this.price,
    required this.region,
    required this.flavorProfile,
    required this.grindOption,
    required this.roastLevel,
    required this.imageUrl
  });
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String price;

  @HiveField(2)
  final String region;

  @HiveField(3)
  List<String> flavorProfile;

  @HiveField(4)
  List<String> grindOption;

  @HiveField(5)
  String roastLevel;

  @HiveField(6)
  String imageUrl;
}
