abstract class BaseNewsRepository {
  Future getNews();
  Future getNewsByCategory(String categoryId, String pageNumber);
  Future getCategory();
  Future getNewsDetail(String newsId);
  Future addNews({
    required String categoryId,
    required String newsTitle,
    required String newsDescription,
    required String newsImg,
});
  Future updateNews({
    required String newsId,
    required String categoryId,
    required String newsTitle,
    required String newsDescription,
    required String newsImg,
});

  Future deleteNews(String newsId);

}