import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'news/business.dart';
import 'news/entertainment.dart';
import 'news/health.dart';
import 'news/sciences.dart';
import 'news/sports.dart';
import 'news/technology.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _tabsPages=<Widget>[
     new NewsBusiness(),
     new NewsEntertainment(),
     new newsHealth(),
     new NewsSciences(),
      new NewsSports(),
      new NewsTechnology(),
    ];
    final _tabs=<Tab>[
      Tab(icon: Icon(Icons.business),text: 'Business',),
      Tab(icon: Icon(Icons.headset_mic),text: 'Entertainment',),
      Tab(icon: Icon(FontAwesomeIcons.heart),text: 'Health',),
      Tab(icon: Icon(FontAwesomeIcons.atom),text: 'Science',),
      Tab(icon: Icon(FontAwesomeIcons.running),text: 'Sports',),
      Tab(icon: Icon(FontAwesomeIcons.microchip),text: 'Technology',),

    ];


    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
          length: _tabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text("News"),
              backgroundColor: Colors.red,
              bottom: TabBar(
                  tabs: _tabs,
                isScrollable: true,
              ),
            ),
            body: TabBarView(
              children: _tabsPages,
              physics: ScrollPhysics(
                parent:ScrollPhysics(),
              ),
            ),
          )
      ),
    );
  }
}