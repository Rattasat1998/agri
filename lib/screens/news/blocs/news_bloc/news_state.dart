part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NModel newsModel;
  final NewsDetailModel? newsDetailModel;
  final CategoryModel categoryModel;
  final Category? currentCategory;
  final bool isNewsLoading;
  final bool isNewsDetailLoading;
   Category? categorySelected;
   String oldImagePath;
   CroppedFile? newImagePath;
  final TextEditingController editNewsTitleController;

  final TextEditingController editNewsDetailController;
  final bool isLoading;

  NewsLoaded({
    required this.newsModel,
    this.newsDetailModel,
    required this.categoryModel,
    this.currentCategory,
    this.categorySelected,
    this.isNewsLoading = false,
    this.isNewsDetailLoading = false,
    this.oldImagePath = '',
    required this.editNewsTitleController,
    required this.editNewsDetailController,
    this.newImagePath,
    this.isLoading = false,
  });

  NewsLoaded copyWith({
    NModel? newsModel,
    NewsDetailModel? newsDetailModel,
    CategoryModel? categoryModel,
    Category? currentCategory,
    bool? isNewsLoading,
    bool? isNewsDetailLoading,
    Category? categorySelected,
    String? oldImagePath,
    TextEditingController? editNewsTitleController,
    TextEditingController? editNewsDetailController,
    CroppedFile? newImagePath,
    bool? isLoading,
  }) {
    return NewsLoaded(
      newsModel: newsModel ?? this.newsModel,
      newsDetailModel: newsDetailModel ?? this.newsDetailModel,
      categoryModel: categoryModel ?? this.categoryModel,
      currentCategory: currentCategory ?? this.currentCategory,
      isNewsLoading: isNewsLoading ?? this.isNewsLoading,
      isNewsDetailLoading: isNewsDetailLoading ?? this.isNewsDetailLoading,
      categorySelected: categorySelected ?? this.categorySelected,
      oldImagePath: oldImagePath ?? this.oldImagePath,
      editNewsTitleController: editNewsTitleController ?? this.editNewsTitleController,
      editNewsDetailController: editNewsDetailController ?? this.editNewsDetailController,
      newImagePath: newImagePath ?? this.newImagePath,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

