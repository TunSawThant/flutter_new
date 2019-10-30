import 'package:flutter/material.dart';
import 'package:flutter_new/news/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {

  final Articles newsarticles;
  NewsDetails({this.newsarticles});


  bodyWidget(BuildContext context)=>Padding(
      padding: EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        Card(
          semanticContainer: true,
          child: Image.network(newsarticles.urlToImage==null?Center(child: Text("Network Error..!"),):newsarticles.urlToImage,fit: BoxFit.fill,),
          shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0),),
          elevation: 5,
          margin:EdgeInsets.all(8.0) ,
        ) ,
        SizedBox(height: 10,),
        Text(newsarticles.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
        Expanded(
            child: SingleChildScrollView(
                child: Text(newsarticles.description,style: TextStyle(fontSize: 16,),),
            ),
        ),
        SizedBox(height: 10.0,),
        InkWell(
          child: Text(newsarticles.url,style: TextStyle(color: Colors.blue),),
          onTap: () async{
              if(await canLaunch(newsarticles.url)){
                await launch(newsarticles.url);
              }
              else
                throw 'Could not launch ${newsarticles.url}';
          },
        ),
        SizedBox(height: 40.0,),
        Wrap(
          children: <Widget>[
            Text("Author\t :${newsarticles.author}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
          ],
        ),
        SizedBox(height: 10,)
      ],
    ),

  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsarticles.title),
        centerTitle: true,
      ),
      body:bodyWidget(context) ,
    );
  }
}
