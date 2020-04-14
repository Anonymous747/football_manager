import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_manager/bloc/bloc_future_matches/bloc.dart';
import 'package:football_manager/bloc/bloc_future_matches/past_matches_bloc.dart';
import 'package:football_manager/models/past_matches_model.dart';
import 'package:football_manager/repositories/matches_repository.dart';

import 'package:football_manager/resourses/constants.dart';
import 'package:football_manager/ui/past_matches_page.dart';

import 'item_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Administator Room'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.brightness_7),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Test manager',
                style: TextStyle(
                  color: Colors.white
                ),),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              )
            ),
            ListTile(
              title: Text(PAGE1),
              onTap: () {},
            ),
            ListTile(
              title: Text(PAGE2),
              onTap: () {},
            ),
            ListTile(
              title: Text(PAGE3),
              onTap: () {},
            )
          ],
        )
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 200,),
            Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text(PAGE1),
                    onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return BlocProvider(
                              create: (context) => PastMatchesBloc(repository: MatchesRepositoriesImpl()),
                              child: PastMatchesPage(),
                            );
                          },
                        )); 
                      },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: RaisedButton(
                      child: Text(PAGE2),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return BlocProvider<PastMatchesBloc> (
                              create: (context) => PastMatchesBloc(repository: MatchesRepositoriesImpl()),
                              child: PastMatchesPage(),
                            );
                          },
                        )); 
                      },
                    ),
                  ),
                  RaisedButton(
                    child: Text(PAGE3),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/r');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  void navigateToItemDetailPage(BuildContext context, Data data) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return ItemDetailPage();
      }
    ));
  }

} 