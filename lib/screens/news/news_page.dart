import 'package:agri/screens/home/bloc/home_bloc.dart';
import 'package:agri/screens/news/blocs/news_bloc/news_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/role_status.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_news_widget.dart';
import 'package:agri/widgets/custom_shimmer.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButtonWidget(),
        actions: [
          Visibility(
            visible: RoleStatus().getRoleAdmin(context),
            child: GestureDetector(
              onTap: () async {
                //context.read<NewsBloc>().add(NewsInitialEvent());
                await Navigator.pushNamed(context, AppRoutes.addEditNewsPage, arguments: false);
                context.read<NewsBloc>().add(NewsReSetValueOnEditEnterEvent());
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xff103300),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    )
                  ],
                ),
                child: const Row(
                  children: [
                    CustomText(
                      text: 'เพิ่มข่าว',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.add_box_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width,
            color: ThemeConfig.primary,
            child: const CustomText(
              text: 'ข่าวสาร/ประชาสัมพันธ์',
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          _buildTabBarWidget(context),
          const SizedBox(height: 10),
          Expanded(
            child: _buildNewsListWidget(context),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsListWidget(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return CustomShimmer.buildListShimmer(context,MediaQuery.of(context).size.height / 3, 5);
        } else if (state is NewsLoaded) {
          return state.isNewsLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : state.newsModel.data!.news.isEmpty
                  ? const Center(child:  CustomText(text: 'ไม่มีข้อมูล', fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold))
                  : ListView.builder(
                      itemCount: state.newsModel.data!.news.length,
                      itemBuilder: (context, index) {
                        final news = state.newsModel.data!.news[index];
                        return CustomNewsWidget(news: news);
                      },
                    );
        } else {
          return const Center(child: CustomText(text: 'Error'));
        }
      },
    );
  }

  Widget _buildTabBarWidget(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return CustomShimmer.buildShimmer(context, 80);
        } else if (state is NewsLoaded) {
          return Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.categoryModel.data!.category
                      .map((e) => GestureDetector(
                            onTap: () {
                              context.read<NewsBloc>().add(CategorySelectedEvent(category: e));
                            },
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: state.currentCategory == e
                                      ? const Color(0xff103300)
                                      : const Color(0xff60894C),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                    )
                                  ],
                                ),
                                child: CustomText(
                                  text: e.categoryName!,
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                          ))
                      .toList(),
                ),
              )
            ],
          );
        } else {
          return const Center(child: CustomText(text: 'Error'));
        }
      },
    );
  }
}

