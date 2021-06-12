import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Mood Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var tabController;
  var selectIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/avatar.jpg",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "Hot Recommended",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    RecommendedCard(),
                    RecommendedCard(),
                    RecommendedCard()
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "Hot Playlist",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      child: Text("View"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        elevation: 5,
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: [
                  HotPlayCard(
                    image: Random().nextInt(7) + 1,
                  ),
                  HotPlayCard(
                    image: Random().nextInt(7) + 1,
                  ),
                  HotPlayCard(
                    image: Random().nextInt(7) + 1,
                  ),
                  HotPlayCard(
                    image: Random().nextInt(7) + 1,
                  ),
                  HotPlayCard(
                    image: Random().nextInt(7) + 1,
                  ),
                  HotPlayCard(
                    image: Random().nextInt(7) + 1,
                  )
                ],
              ),
            ),
            Text(
              "Our Choice For You ",
              style: TextStyle(fontSize: 20),
            ),
            TabBar(
              controller: tabController,
              indicatorColor: Colors.pink,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 5,
              tabs: [
                Tab(child: Text("Songs")),
                Tab(
                  child: Text("Playlists"),
                )
              ],
            ),
            LimitedBox(
              maxHeight: 400,
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView(
                    children: [ChoiceCard(), ChoiceCard()],
                  ),
                  ListView(
                    children: [ChoiceCard()],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Image.asset(
            "assets/p4.jpg",
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Counting Stars",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Onerepublic Native",
                    style: TextStyle(color: Colors.white70),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [Icon(Icons.favorite), Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("200"),
            )],
          )
        ],
      ),
    );
  }
}

class HotPlayCard extends StatelessWidget {
  final image;

  HotPlayCard({this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 47),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset("assets/p$image.jpg")),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "My Classic List",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              children: [
                Icon(Icons.favorite),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    "250",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Spacer(),
                Icon(Icons.details),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text("10", style: TextStyle(color: Colors.white70)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/p1.jpg",
              fit: BoxFit.cover,
              width: 300,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Sound of water",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Text(
              "Denis Brewer",
              style: TextStyle(color: Colors.white70),
            )
          ],
        ),
      ),
    );
  }
}
