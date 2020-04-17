import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_manager/bloc/bloc_cups/bloc.dart';
import 'package:football_manager/bloc/bloc_leagues/bloc.dart';
import 'package:football_manager/models/cups_model.dart';
import 'package:football_manager/repositories/matches_repository.dart';
import 'package:football_manager/resourses/constants.dart';

import 'leagues_page.dart';

class CupsPage extends StatefulWidget {
  @override
  _CupsPageState createState() => _CupsPageState();
}

class _CupsPageState extends State<CupsPage> {
  CupsBloc pastMatchesBloc;

 @override
 void initState() {
    super.initState();
    pastMatchesBloc = BlocProvider.of<CupsBloc>(context);
    pastMatchesBloc.add(FetchCupsEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CUPS_NAME),
      ),
      body: BlocListener<CupsBloc, CupsState>(
        listener: (context, state) {
          if (state is CupsErrorState) {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
          }
        },
        child: BlocBuilder<CupsBloc, CupsState>(
          builder: (context, state) {
              if (state is CupsInitialState) {
                return buildingLoading();
              } else if (state is CupsLoadedState) {
                return buildPastMatchesList(state.cup.competition);
              } else if (state is CupsErrorState) {
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

  Widget buildPastMatchesList(List<Competition> competition) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, pos) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            child: ListTile(
              title: Text(competition[pos].name),
              subtitle: Text(competition[pos].countries[0].name),
              onTap: () {
                return Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider<LeaguesBloc>(
                        create: (context) => LeaguesBloc(
                          repository: MatchRepositoriesImpl(),
                          leaguesName: competition[pos].name),
                        child: LeaguesPage(),
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