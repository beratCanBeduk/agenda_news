

import 'package:agenda_news/controllers/data.dart';
import 'package:agenda_news/controllers/news_controller.dart';
import 'package:agenda_news/core/common_widgets/category_tile.dart';
import 'package:agenda_news/core/common_widgets/news_list_tile.dart';
import 'package:agenda_news/models/category_model.dart';
import 'package:agenda_news/models/news_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<Article> myNewsList = [];
  late Future<NewsModel> future ;
  NewsController newsController = NewsController();

  Future getListNews() async {
    NewsController news = NewsController();
    await news.getNews();
    myNewsList = news.newsList;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    future = newsController.getNews();

    getListNews();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Agenda",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.red),
            )
          ],
        ),


      ),
      body: Container(
        child:  SingleChildScrollView(
          child: Container(
              child:  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: 100,
                        child: ListView.builder(
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                imageUrl: categories[index].imageUrl,
                                categoryName: categories[index].categoryName,
                              );
                            }),
                      ),
                    ),
                   FutureBuilder(
                       future: future,
                       builder: (context , snapshot){
                         if(snapshot.hasData){
                           return Container(
                             height: MediaQuery.of(context).size.height,
                             width: MediaQuery.of(context).size.width,

                             child: ListView.builder(
                                 itemCount: myNewsList.length ,

                                 itemBuilder: (context, index) {

                                   return Padding(
                                     padding: EdgeInsets.all(10),
                                     child: NewsTile(
                                       imageUrl:  myNewsList[index].urlToImage,
                                       title: myNewsList[index].title,
                                       newsDescription: myNewsList[index].description,
                                       webUrl: myNewsList[index].url,

                                     ),
                                   ) ;


                                 }),
                           );
                         }
                         else{
                           return Container(

                               child: CircularProgressIndicator(color : Colors.red)
                           );
                         }
                       }
                   )
                  ],
                ),

            ),
        ),

      ),
    );
  }
}
