import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/news_model.dart';
import '../../data/news_repository.dart';

abstract class NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsModel> news;
  NewsLoaded(this.news);
}

class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
}

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository repository;

  NewsCubit(this.repository) : super(NewsLoading());

  Future<void> fetchNews() async {
    emit(NewsLoading());
    try {
      final data = await repository.getNews();
      if (data.isEmpty) {
        emit(NewsError("Tidak ada data tersimpan. Periksa koneksi internet."));
      } else {
        emit(NewsLoaded(data));
      }
    } catch (e) {
      emit(NewsError("Terjadi kesalahan: ${e.toString()}"));
    }
  }
}
