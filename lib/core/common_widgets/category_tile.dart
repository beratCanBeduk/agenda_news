import 'package:agenda_news/views/category_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String? imageUrl;
  final String? categoryName;

  const CategoryTile({this.imageUrl, this.categoryName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) =>CategoryView(category: categoryName!.toLowerCase())));
      },
      child: Container(

        margin: const EdgeInsets.only(right: 15),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl!, width: 120, height: 60, fit: BoxFit.cover,
              ),


            ),
            Container(

              height: 60,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              alignment: Alignment.center,
              child: Text(
                "$categoryName", style: const TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.w500),),
            )
          ],
        ),
      ),
    );
  }
}