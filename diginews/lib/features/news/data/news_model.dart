import 'package:isar/isar.dart';

part 'news_model.g.dart';

@collection
class NewsModel {
  Id id = Isar.autoIncrement;

  late String title;
  late String? description;
  late String? imageUrl;
  late String? sourceName;
}
