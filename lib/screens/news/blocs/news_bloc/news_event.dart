part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class NewsInitialEvent extends NewsEvent {}

class GetNewsByCategoryEvent extends NewsEvent {
  final String categoryId;
  final String pageNumber;

  GetNewsByCategoryEvent({
    required this.categoryId,
    required this.pageNumber,
  });
}

class GetCategory extends NewsEvent {}

class GetNewsDetailEvent extends NewsEvent {
  final BuildContext context;
  final String newsId;


  GetNewsDetailEvent({
    required this.newsId,
    required this.context,
  });
}

class CategorySelectedEvent extends NewsEvent {
  final Category category;

  CategorySelectedEvent({
    required this.category,
  });
}

class CategoryAddEditSelectedEvent extends NewsEvent {
  final Category category;

  CategoryAddEditSelectedEvent({
    required this.category,
  });
}

class NewsSelectImageEvent extends NewsEvent {
  final CroppedFile image;

  NewsSelectImageEvent({
    required this.image,
  });
}


class NewsSetValueOnEditEnterEvent extends NewsEvent {}

class NewsReSetValueOnEditEnterEvent extends NewsEvent {}

class AddOrEditEvent extends NewsEvent {
  final BuildContext context;

  final bool isEdit;

  AddOrEditEvent({
    required this.isEdit,
    required this.context,
  });


}

class DeleteNewsEvent extends NewsEvent {
  final String newsId;

  DeleteNewsEvent({
    required this.newsId,
  });
}
