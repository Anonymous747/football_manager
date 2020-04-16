import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_manager/bloc/bloc_future_matches/bloc.dart';
import 'package:football_manager/models/past_matches_model.dart';
import 'package:football_manager/resourses/constants.dart';

import 'package:http/http.dart' as http;


class PastMatchesPage extends StatefulWidget {
  @override
  _PastMatchesPageState createState() => _PastMatchesPageState();
}

class _PastMatchesPageState extends State<PastMatchesPage> {
 
PastMatchesBloc pastMatchesBloc;

 @override
 void initState() {
    super.initState();
    pastMatchesBloc = BlocProvider.of<PastMatchesBloc>(context);
    pastMatchesBloc.add(FetchData());
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(PAGE1),),
      body: BlocListener<PastMatchesBloc, PastMatchesState>(
        listener: (context, state) {
          if (state is PastMatchesErrorState) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          }
        },
        child: BlocBuilder<PastMatchesBloc, PastMatchesState>(
          builder: (context, state) {
            if (state is PastMatchesInitialState) {
              return buildingLoading();
            } else if (state is PastMatchesLoadingState) {
              return buildingLoading();
            } else if (state is PastMatchesLoadedState) {
              return buildPastMatchesList(state.data.match);
            } else if (state is PastMatchesErrorState) {
              buildError(state.message);
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

  Widget buildPastMatchesList(List<Match> match) {
    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, pos) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            child: ListTile(
              title: Text(match[pos].competitionName),
              subtitle: Text(match[pos].date),
              onTap: () {
                return Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(title: Text(match[pos].awayName),),
                        body: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              
                              Text(match[pos].competitionId),
                              Text(match[pos].homeName)
                            ],
                          ),
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