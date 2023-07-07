import 'package:bloc_http_api/blocs/bloc_class.dart';
import 'package:bloc_http_api/blocs/bloc_event.dart';
import 'package:bloc_http_api/blocs/bloc_state.dart';
import 'package:bloc_http_api/repos/repository.dart';
import 'package:bloc_http_api/userModel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userBloc(
        RepositoryProvider.of<userRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            title: Text('The Bloc App'),
          ),
          body: BlocBuilder<userBloc, UserState>(
            builder: (context, state) {
              if (state is userLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is userLoadedState) {
                List<UserModel> userList = state.users;
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.greenAccent,
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(userList[index].firstName),
                        subtitle: Text(userList[index].lastName),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(userList[index].avatar),
                        ),
                      ),
                    );
                  },
                );
              }
              if (state is dataErrorState) {
                return Center(
                  child: Text("Data Error"),
                );
              }
              return Container(
                child: Text("im container"),
              );
            },
          )),
    );
  }
}
