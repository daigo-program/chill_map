import 'package:chill_map/presentation/login/login_page.dart';
import 'package:chill_map/presentation/map/map_page.dart';
import 'package:chill_map/presentation/my/my_page.dart';
import 'package:chill_map/presentation/timeline/time_line_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Container(
                  height: 50.0,
                  padding: EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.network(
                        'https://user-images.githubusercontent.com/5169035/44525654-f0a50880-a6e1-11e8-8522-0f00aa811a6b.png'),
                  )),
              SizedBox(
                width: 20.0,
              ),
              FlatButton(
                child: Text(
                  'Chill Log',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
              ),
              TabBar(
                controller: tabController,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.withOpacity(0.6),
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Home',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Map',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'MyPage',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ]),
            Container(
                color: Colors.black,
                padding: EdgeInsets.only(
                    left: 100.0, top: 50.0, right: 100.0, bottom: 50.0),
                height: MediaQuery.of(context).size.height - 150.0,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                    physics:
                        NeverScrollableScrollPhysics(), //画面の横スワイプをできないようにする
                    controller: tabController,
                    children: [
                      TimeLinePage(),
                      MapPage(),
                      LoginPage(),
                    ]))
          ],
        ),
      ),
    );
  }
}
