import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_manager/bloc/bloc_federations/bloc.dart';
import 'package:football_manager/models/federations_model.dart';
import 'package:football_manager/resourses/constants.dart';

class FederationsPage extends StatefulWidget {
  @override
  _FederationsPageState createState() => _FederationsPageState();
}

class _FederationsPageState extends State<FederationsPage> {
  FederationsBloc pastMatchesBloc;

 @override
 void initState() {
    super.initState();
    pastMatchesBloc = BlocProvider.of<FederationsBloc>(context);
    pastMatchesBloc.add(FetchDataEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PAGE2),
      ),
      body: BlocListener<FederationsBloc, FederationsState>(
        listener: (context, state) {
          if (state is FederationsErrorState) {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
          }
        },
        child: BlocBuilder<FederationsBloc, FederationsState>(
          builder: (context, state) {
              if (state is FederationsInitialState) {
                return buildingLoading();
              } else if (state is FederationsLoadingState) {
                return buildingLoading();
              } else if (state is FederationsLoadedState) {
                return buildPastMatchesList(state.info.federation);
              } else if (state is FederationsErrorState) {
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

  Widget buildPastMatchesList(List<Federation> federation) {
    return ListView.builder(
      itemCount: federation.length,
      itemBuilder: (context, pos) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            child: ListTile(
              title: Text(federation[pos].name),
              onTap: () {
                return Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(title: Text(federation[pos].name),),
                        body: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              
                              Text(federation[pos].name),
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