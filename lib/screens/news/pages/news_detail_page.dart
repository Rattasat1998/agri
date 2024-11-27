import 'package:agri/models/news_model.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/role_status.dart';
import 'package:agri/widgets/custom_date_time.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:agri/widgets/custom_shimmer.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../widgets/back_button_widget.dart';
import '../blocs/news_bloc/news_bloc.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return CustomShimmer.buildNewsDetailShimmer(context);
          }
          if (state is NewsLoaded) {
            final date = state.newsDetailModel?.data!.news!;
            return state.isNewsDetailLoading || date == null
                ? CustomShimmer.buildNewsDetailShimmer(context)
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 400,
                        pinned: true,
                        leading: const BackButtonWidget(),
                        flexibleSpace: FlexibleSpaceBar(
                          background: Image.network(
                            date.newsImg!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network(
                                ImageNetworkProviders.errorImage,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    text:
                                        'อัพเดทเมื่อ วันที่ ${CustomDateTime.getFormattedDate(date.updatedAt!)} ',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.end,
                                  ),
                                  const SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: CustomText(
                                      text: date.newsTitle!,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: CustomText(
                                      text: date.newsDescription!,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoaded) {
            final date = state.newsDetailModel?.data!.news!;
            return state.isNewsDetailLoading || date == null
                ? const SizedBox()
                : Visibility(
                    visible: RoleStatus().getRoleAdmin(context),
                    child: BottomAppBar(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: CupertinoButton(
                                color: const Color(0xffFFB800),
                                onPressed: () async {
                                  BlocProvider.of<NewsBloc>(context)
                                      .add(NewsSetValueOnEditEnterEvent());
                                  await Navigator.pushNamed(context, AppRoutes.addEditNewsPage,
                                      arguments: true);
                                  context.read<NewsBloc>().add(NewsReSetValueOnEditEnterEvent());
                                },
                                child: const CustomText(
                                  text: 'แก้ไข',
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CupertinoButton(
                                color: const Color(0xffBF1D1D),
                                onPressed: () {
                                  CustomDialog.showCustomDeleteDialog(
                                      context: context,
                                      title: '',
                                      description: 'คุณต้องการลบข่าวนี้ใช่หรือไม่?',
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 50,
                                      ),
                                      onCancelPressed: () {
                                        Get.back();
                                      },
                                      onPressed: state.isLoading
                                          ? null
                                          : () {
                                              context.read<NewsBloc>().add(DeleteNewsEvent(
                                                    newsId: date.newsId.toString(),
                                                  ));
                                              Get.back();
                                              Get.back();
                                              context.read<NewsBloc>().add(NewsInitialEvent());
                                            });
                                },
                                child: state.isLoading
                                    ? const CircularProgressIndicator.adaptive()
                                    : const CustomText(
                                        text: 'ลบ',
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
