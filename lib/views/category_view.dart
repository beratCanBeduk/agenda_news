import 'package:flutter/material.dart';

import '../controllers/news_controller.dart';
import '../core/common_widgets/news_list_tile.dart';
import '../models/news_model.dart';
class CategoryView extends StatefulWidget {
  final String category ;
  const CategoryView({Key? key , required this.category}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late Future<NewsModel> future ;
  List<Article> myList = [];

  NewsController newsController = NewsController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = newsController.getNews();
    getCategoryListNews();
  }
  Future getCategoryListNews() async {
    CategoryNewsController news = CategoryNewsController();
    await news.getCategoryNews(widget.category);
    myList = news.newsList;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red, //change your color here
        ),
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
      body:FutureBuilder(
          future: future,
          builder: (context , snapshot){
            if(snapshot.hasData){
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,

                child: ListView.builder(
                    itemCount: myList.length ,

                    itemBuilder: (context, index) {

                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: NewsTile(
                          imageUrl:  myList[index].urlToImage,
                          title: myList[index].title,
                          newsDescription: myList[index].description,
                          webUrl: myList[index].url,

                        ),
                      ) ;


                    }),
              );
            }
            else{
              return Center(

                  child: CircularProgressIndicator(color : Colors.red)
              );
            }
          }
      )
    );
  }
}
