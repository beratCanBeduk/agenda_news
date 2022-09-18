

import 'package:agenda_news/models/news_model.dart';

import 'package:http/http.dart' as http;

class NewsController {
  List<Article> newsList = [];
  List<Article> deneme = [];
  String newsUrl = "https://newsapi.org/v2/top-headlines?country=de&apiKey=299d76576db242309807ef278254b727";

  Future<NewsModel> getNews() async {
    var response = await http.get(Uri.parse(newsUrl));
    if(response.statusCode == 200){
      var data = newsModelFromJson(response.body);
      for(int index = 0 ; index< data.articles!.length  ; index++ ){
        if(data.articles![index].urlToImage != null){
          newsList.add(data.articles![index]);
        }
      }
      return data ;
    }
    else{
      throw Exception("Hatalı Geldi");

    }
    }
  }


class CategoryNewsController {
  List<Article> newsList = [];
  List<Article> deneme = [];
  Future<NewsModel> getCategoryNews(String category) async {
    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&category=$category&apiKey=299d76576db242309807ef278254b727"));
    if(response.statusCode == 200){

      var data = newsModelFromJson(response.body);
      for(int index = 0 ; index< data.articles!.length  ; index++ ){
        if(data.articles![index].urlToImage != null){
          newsList.add(data.articles![index]);
        }
      }return data ;
    }
    else{
      throw Exception("Hatalı Geldi");
    }
  }
}

