import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'news_model.dart';

class NewsRepository {
  final Dio dio;
  final Isar isar;

  NewsRepository(this.dio, this.isar);

  Future<List<NewsModel>> getNews() async {
    try {
      final response = await dio.get(
        'https://saurav.tech/NewsAPI/top-headlines/category/technology/us.json',
      );

      final List articles = response.data['articles'];

      List<NewsModel> newsList = articles.map((json) {
        return NewsModel()
          ..title = json['title'] ?? 'No Title'
          ..description = json['description']
          ..imageUrl = json['urlToImage']
          ..sourceName = json['source']['name'];
      }).toList();

      newsList.sort((a, b) => b.title.compareTo(a.title));

      await isar.writeTxn(() async {
        await isar.newsModels.clear();
        await isar.newsModels.putAll(newsList);
      });

      return newsList;
    } catch (e) {
      final offlineData = await isar.newsModels.where().findAll();

      offlineData.sort((a, b) => b.title.compareTo(a.title));

      return offlineData;
    }
  }
}
