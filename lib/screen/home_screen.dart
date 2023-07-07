import 'package:bloc_http_api/blocs/bloc_class.dart';
import 'package:bloc_http_api/blocs/bloc_event.dart';
import 'package:bloc_http_api/repos/repository.dart';
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
    );
  }
}
