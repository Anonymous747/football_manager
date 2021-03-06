import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_manager/bloc/bloc_federations/bloc.dart';
import 'package:football_manager/bloc/bloc_future_matches/bloc.dart';
import 'package:football_manager/bloc/bloc_future_matches/past_matches_bloc.dart';
import 'package:football_manager/models/past_matches_model.dart';
import 'package:football_manager/repositories/matches_repository.dart';

import 'package:football_manager/resourses/constants.dart';
import 'package:football_manager/ui/past_matches_page.dart';

import 'federation.dart';
import 'federation_results.dart';
import 'ui_parts/item_detail_page.dart';

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
            
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buttonOne(),
                  _buttonTwo(),
                  _buttonThree(),
                ],
              )
            ],
        ),
      )
    );
  }

  _buttonOne() {
    RaisedButton(
      child: Text(PAGE1),
      onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return BlocProvider(
                create: (context) => PastMatchesBloc(repository: MatchRepositoriesImpl()),
                child: PastMatchesPage(),
            );
          },
        )); 
      },
    );
  }

  _buttonTwo() {
    Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: RaisedButton(
        child: Text(PAGE2),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return BlocProvider<FederationsBloc> (
                create: (context) => FederationsBloc(repository: MatchRepositoriesImpl()),
                child: FederationsPage(),
              );
            },
          )); 
        },
      ),
    );
  }

  _buttonThree() {
    RaisedButton(
      child: Text(PAGE3),
      onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return BlocProvider<FederationsBloc> (
                create: (context) => FederationsBloc(repository: MatchRepositoriesImpl()),
                child: FederationResultsPage(),
              );
            },
          )
        ); 
      },
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