import 'package:agenda_news/controllers/news_controller.dart';
import 'package:agenda_news/views/article.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class NewsTile extends StatelessWidget {
  final String? imageUrl,title,newsDescription, webUrl ;

   NewsTile({this.title , this.newsDescription , this.imageUrl ,this.webUrl,
    Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push( MaterialPageRoute(builder: (context) => Article(webUrl: webUrl,)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(borderRadius:BorderRadius.circular(10),child: CachedNetworkImage(
              imageUrl: imageUrl!,
            )),
            Text(title! , style: const TextStyle(fontSize: 19 , fontWeight: FontWeight.bold),),
            const SizedBox(height: 15,),
            Text(newsDescription! ,style: const TextStyle(color: Colors.black54),)

          ],
        ),
      ),
    );;
  }
}

