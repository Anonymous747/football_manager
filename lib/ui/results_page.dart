import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_manager/bloc/bloc_results/bloc.dart';
import 'package:football_manager/models/results.dart';
import 'package:football_manager/resourses/constants.dart';


class ResultsPage extends StatefulWidget {
  @override
  _ResultsPage createState() => _ResultsPage();
}

class _ResultsPage extends State<ResultsPage> {
  ResultsBloc pastMatchesBloc;

 @override
 void initState() {
    super.initState();
    pastMatchesBloc = BlocProvider.of<ResultsBloc>(context);
    pastMatchesBloc.add(FetchResultsEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RESULTS_NAME),
      ),
      body: BlocListener<ResultsBloc, ResultsState>(
        listener: (context, state) {
          if (state is ResultsErrorState) {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
          }
        },
        child: BlocBuilder<ResultsBloc, ResultsState>(
          builder: (context, state) {
              if (state is ResultsInitialState) {
                return buildingLoading();
              } else if (state is ResultsLoadedState) {
                return buildPastMatchesList(state.results);
              } else if (state is ResultsErrorState) {
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

  Widget buildPastMatchesList(Results results) {
    return ListView.builder(
      itemCount: results.table.length,
      itemBuilder: (context, pos) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            child: ListTile(
              title: Text(results.table[pos].matches),
              subtitle: Text(results.table[pos].lost),
              onTap: () {
                return Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(title: Text(results.table[pos].name),),
                        body: Column(
                          children: <Widget>[
                            Text("competitionId: ${results.table[pos].competitionId}"),
                            Text("drawn: ${results.table[pos].drawn}"),
                            Text("goalDiff: ${results.table[pos].goalDiff}"),
                            Text("goalsConceded: ${results.table[pos].goalsConceded} "),
                            Text("goalsScored: ${results.table[pos].goalsScored} "),
                            Text("leagueId: ${results.table[pos].leagueId} "),
                            Text("lost: ${results.table[pos].lost} "),
                            Text("matches: ${results.table[pos].matches} "),
                            Text("name: ${results.table[pos].name} "),
                            Text("points: ${results.table[pos].points} "),
                            Text("won: ${results.table[pos].won} "),
                            Text("teamId: ${results.table[pos].teamId} "),
                            Text("seasonId: ${results.table[pos].seasonId}"),
                            Text("rank: ${results.table[pos].rank}"),
                            Text("points: ${results.table[pos].points}"),
                          ]
                        )
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