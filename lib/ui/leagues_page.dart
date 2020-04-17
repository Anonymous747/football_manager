import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_manager/bloc/bloc_leagues/bloc.dart';
import 'package:football_manager/models/leagues_model.dart';
import 'package:football_manager/resourses/constants.dart';

class LeaguesPage extends StatefulWidget {
  @override
  _LeaguesPageState createState() => _LeaguesPageState();
}

class _LeaguesPageState extends State<LeaguesPage> {
   LeaguesBloc pastMatchesBloc;

 @override
 void initState() {
    super.initState();
    pastMatchesBloc = BlocProvider.of<LeaguesBloc>(context);
    pastMatchesBloc.add(FetchLeaguesEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LEAGUES_NAME),
      ),
      body: BlocListener<LeaguesBloc, LeaguesState>(
        listener: (context, state) {
          if (state is LeaguesErrorState) {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
          }
        },
        child: BlocBuilder<LeaguesBloc, LeaguesState>(
          builder: (context, state) {
              if (state is LeaguesInitialState) {
                return buildingLoading();
              } else if (state is LeaguesLoadedState) {
                return buildPastMatchesList(state.leagues.leagues);
              } else if (state is LeaguesErrorState) {
                buildError(state.error);
              }
              return Container();
            }
        ),
      )
    );
  }


  Widget buildingLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildError(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        )
      ),
    );
  }

  Widget buildPastMatchesList(List<League> leagues) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, pos) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            child: ListTile(
              title: Text(leagues[pos].name),
              subtitle: Text(leagues[pos].scores),
              onTap: () {
                return Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text("text"),
                        ),
                      );
                    }
                  )
                );
              },              
            )
          )
        );
      },
    );
  }
}