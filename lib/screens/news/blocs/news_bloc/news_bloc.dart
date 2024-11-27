import 'dart:async';

import 'package:agri/models/category_model.dart';
import 'package:agri/models/news_model.dart';
import 'package:agri/screens/news/repository/news_repository.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../widgets/custom_dialog.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository = NewsRepository();

  NewsBloc() : super(NewsLoading()) {
    on<NewsInitialEvent>(_onNewsInitialEvent);
    on<GetCategory>(_onGetCategory);
    on<GetNewsDetailEvent>(_onGetNewsDetailEvent);
    on<GetNewsByCategoryEvent>(_onGetNewsByCategoryEvent);
    on<CategorySelectedEvent>(_onCategorySelectedEvent);
    on<CategoryAddEditSelectedEvent>(_onCategoryAddEditSelectedEvent);
    on<NewsSelectImageEvent>(_onNewsSelectImageEvent);
    on<NewsSetValueOnEditEnterEvent>(_onNewsSetValueOnEditEnterEvent);
    on<NewsReSetValueOnEditEnterEvent>(_onNewsReSetValueOnEditEnterEvent);
    on<AddOrEditEvent>(_onAddOrEditEvent);
    on<DeleteNewsEvent>(_onDeleteNewsEvent);
  }

  void _onDeleteNewsEvent(DeleteNewsEvent event, Emitter<NewsState> emit) async {
    final state = this.state;
    if (state is NewsLoaded) {
      emit(state.copyWith(isLoading: true));
      try {

        await _newsRepository.deleteNews(event.newsId);

      emit(state.copyWith(isLoading: false));

      } catch (e) {
        print(e);
      }
    }
  }


  void _onAddOrEditEvent(AddOrEditEvent event, Emitter<NewsState> emit) async {
    final state = this.state;
    final context = event.context;
    if (state is NewsLoaded) {
      emit(state.copyWith(isNewsLoading: true));
      try {
        EasyLoading.show(status: 'กำลังโหลด');
        if (event.isEdit) {
          print('edit');

         final response =  await _newsRepository.updateNews(
            categoryId: state.categorySelected!.categoryId.toString(),
            newsTitle: state.editNewsTitleController.text,
            newsDescription: state.editNewsDetailController.text,
            newsImg: state.newImagePath?.path ?? '',
            newsId: state.newsDetailModel!.data!.news!.newsId.toString(),
          );
         if(response['result']){
           EasyLoading.dismiss();
           CustomDialog.showCustomDialog(
             context: context,
             title: '',
             description: 'ได้เพิ่มข่าวสารเรียบร้อยแล้ว',
             icon: const Icon(
               Icons.check_circle,
               color: Colors.green,
               size: 100,
             ),
             onPressed: () {
               Navigator.of(context,rootNavigator: true).pop();
               Navigator.of(context,rootNavigator: true).pop();
               Navigator.of(context,rootNavigator: true).pop();
               context.read<NewsBloc>().add(NewsInitialEvent());
             },
           );
         }

        } else {
          print('add');
          //Navigator.of(context,rootNavigator: true).pop();
          final response = await _newsRepository.addNews(
            categoryId: state.categorySelected!.categoryId.toString(),
            newsTitle: state.editNewsTitleController.text,
            newsDescription: state.editNewsDetailController.text,
            newsImg: state.newImagePath?.path ?? '',
          );
          if (response['result']) {
            EasyLoading.dismiss();
            CustomDialog.showCustomDialog(
              context: context,
              title: '',
              description: 'ได้เพิ่มข่าวสารเรียบร้อยแล้ว',
              icon: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
              onPressed: () {
                Get.back();
                Get.back();
                context.read<NewsBloc>().add(NewsInitialEvent());
              },
            );
          }
        }

      } catch (e,t) {
        print(e);
        print(t);
      }
    }
  }


  void _onNewsReSetValueOnEditEnterEvent(
      NewsReSetValueOnEditEnterEvent event, Emitter<NewsState> emit) async {
    final state = this.state;
    if (state is NewsLoaded) {
      try {
        state.editNewsTitleController?.clear();
        state.editNewsDetailController?.clear();
        state.oldImagePath = '';
        state.categorySelected = null;
        state.newImagePath = null;

        emit(state.copyWith(
          editNewsTitleController: state.editNewsTitleController,
          editNewsDetailController: state.editNewsDetailController,
          oldImagePath: state.oldImagePath,
          newImagePath: null,
          categorySelected: state.categorySelected,
        ));
      } catch (e) {
        print(e);
      }
    }
  }

  void _onNewsSetValueOnEditEnterEvent(
      NewsSetValueOnEditEnterEvent event, Emitter<NewsState> emit) async {
    final state = this.state;
    if (state is NewsLoaded) {
      emit(state.copyWith(
        editNewsTitleController:
            TextEditingController(text: state.newsDetailModel!.data!.news!.newsTitle),
        editNewsDetailController:
            TextEditingController(text: state.newsDetailModel!.data!.news!.newsDescription),
        oldImagePath: state.newsDetailModel!.data!.news!.newsImg!,
        categorySelected: state.categoryModel.data!.category.firstWhere(
            (element) => element.categoryId == state.newsDetailModel!.data!.news!.categoryId),
      ));
    }
  }

  void _onNewsSelectImageEvent(NewsSelectImageEvent event, Emitter<NewsState> emit) async {
    final state = this.state;
    if (state is NewsLoaded) {
      emit(state.copyWith(newImagePath: event.image));
    }
  }

  void _onNewsInitialEvent(NewsInitialEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    final categoryModel = await _newsRepository.getCategory();

    Category categoryFirst = Category(categoryId: 9999, categoryName: 'ทั้งหมด');

    final category = [categoryFirst, ...categoryModel.data!.category];
    categoryModel.data!.category = category;

    final newsModel = await _newsRepository.getNews();
    emit(NewsLoaded(
      categoryModel: categoryModel,
      newsModel: newsModel,
      currentCategory: categoryFirst,
      editNewsTitleController: TextEditingController(),
      editNewsDetailController: TextEditingController(),
    ));
  }

  void _onCategorySelectedEvent(CategorySelectedEvent event, Emitter<NewsState> emit) async {
    final state = this.state;
    if (state is NewsLoaded) {
      NModel? model;
      emit(state.copyWith(currentCategory: event.category, isNewsLoading: true));
      if (event.category.categoryId == 9999) {
        final newsModel = await _newsRepository.getNews();
        model = newsModel;
      } else {
        final newsModel =
            await _newsRepository.getNewsByCategory(event.category.categoryId.toString(), '1');
        model = newsModel;
      }
      if (model!.data!.news.isEmpty) {
        emit(state.copyWith(
            newsModel: model, currentCategory: event.category, isNewsLoading: false));
      } else {
        emit(state.copyWith(
            newsModel: model, currentCategory: event.category, isNewsLoading: false));
      }
    }
  }

  void _onGetCategory(GetCategory event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    final categoryModel = await _newsRepository.getCategory();
    emit(NewsLoaded(
      categoryModel: categoryModel,
      newsModel: (state as NewsLoaded).newsModel,
      editNewsTitleController: TextEditingController(),
      editNewsDetailController: TextEditingController(),
    ));
  }

  void _onGetNewsDetailEvent(GetNewsDetailEvent event, Emitter<NewsState> emit) async {
    final state = this.state;
    final context = event.context;
    if (state is NewsLoaded) {
      emit(state.copyWith(isNewsDetailLoading: true));

      try {
        Navigator.pushNamed(context, AppRoutes.newsDetailPage);
        await Future.delayed(const Duration(seconds: 1));
        final newsDetailModel = await _newsRepository.getNewsDetail(event.newsId);
        emit(state.copyWith(newsDetailModel: newsDetailModel, isNewsDetailLoading: false));
      } catch (e) {
        print(e);
      }
    }
  }

  void _onGetNewsByCategoryEvent(GetNewsByCategoryEvent event, Emitter<NewsState> emit) async {
    final state = this.state;
    if (state is NewsLoaded) {
      final newsModel = await _newsRepository.getNewsByCategory(event.categoryId, event.pageNumber);
      emit(state.copyWith(newsModel: newsModel));
    }
  }

  void _onCategoryAddEditSelectedEvent(
      CategoryAddEditSelectedEvent event, Emitter<NewsState> emit) async {
    final state = this.state;
    if (state is NewsLoaded) {
      emit(state.copyWith(categorySelected: event.category));
    }
  }
}
