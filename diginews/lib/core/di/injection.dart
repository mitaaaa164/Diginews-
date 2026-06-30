import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/news/data/news_model.dart';
import '../../features/news/data/news_repository.dart';

final locator = GetIt.instance;

Future<void> initDependencies() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([NewsModelSchema], directory: dir.path);
  locator.registerSingleton<Isar>(isar);

  locator.registerLazySingleton<Dio>(() => Dio());

  locator.registerLazySingleton<NewsRepository>(
    () => NewsRepository(locator<Dio>(), locator<Isar>()),
  );
}
