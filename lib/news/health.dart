import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_new/news/news.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_new/news/newsdetails.dart';

class newsHealth extends StatefulWidget {
  @override
  _NewsHomePageState createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<newsHealth> {
  static var APIKEY = "fec0d7d3355b4e3db5765b02401df408";
  var url = "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=$APIKEY";

  newsClass news;

  fetchData() async{
    var res = await get(url);
    var decodedJson = jsonDecode(res.body);
    news = newsClass.fromJson(decodedJson);
    print(res.body);
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: news==null?
      Center(child:CircularProgressIndicator()):
      GridView.count(
        crossAxisCount: 1,
        children: news.articles.map((n)=>
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetails(newsarticles:n,)));
              },
              child: Hero(
                  tag: n.title,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.network(
                          n.urlToImage==null?"https://www.aljazeera.com/mritems/Images/2019/10/15/3f1fccd4b0e54adea1ce9669903cad42_18.jpg":n.urlToImage,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child:Wrap(
                            children: <Widget>[
                              Text(n.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),)
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right:10.0),
                              child: Text(n.publishedAt,style: TextStyle(fontStyle: FontStyle.italic),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),

                  )
              ),
            )).toList(),


      ) ,

    );
  }
}

