import 'package:agri/models/news_model.dart';
import 'package:agri/screens/news/blocs/news_bloc/news_bloc.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/custom_date_time.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNewsWidget extends StatelessWidget {
  const CustomNewsWidget({
    super.key,
    required this.news,
  });

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, AppRouters.newsDetail, arguments: news);
        context.read<NewsBloc>().add(GetNewsDetailEvent(
              newsId: news.newsId.toString(),
              context: context,
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Image.network(
                news.newsImg!,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 200,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    ImageNetworkProviders.errorImage,
                    fit: BoxFit.cover,
                  ); /*const SizedBox(
                    height: 200,
                    child: Center(
                      child: CustomText(
                        text: 'No Image',
                        fontSize: 20,
                      ),
                    ),
                  );*/
                },
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: news.newsTitle!,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 10),
            CustomText(
              text: 'อัพเดทเมื่อ วันที่ ${CustomDateTime.getFormattedDate(news.updatedAt!)} ',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
