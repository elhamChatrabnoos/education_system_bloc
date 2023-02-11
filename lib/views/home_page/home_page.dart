import 'package:education_system_bloc/controllers/class_bloc/class_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ClassBloc())
        // BlocProvider(create: (context) => TermBloc())
      ],
      child: HomeView(),
    );
  }
}
