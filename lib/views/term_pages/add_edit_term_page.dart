import 'package:education_system_bloc/views/term_pages/add_edit_term_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/term_bloc/term_bloc.dart';
import '../../models/term_model.dart';

class AddEditTermPage extends StatelessWidget {
  AddEditTermPage(
      {Key? key,
      this.selectedTerm,
      required this.termBloc,
        // this.classBloc
      })
      : super(key: key);


  final TermModel? selectedTerm;
  final TermBloc termBloc;
  // final ClassBloc? classBloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: termBloc,
        ),
        // BlocProvider.value(
        //   value: classBloc,
        // ),
      ],
      child: AddEditTermView(
          selectedTerm: selectedTerm,
          termBloc: termBloc,
          // classBloc: classBloc
      ),
    );
  }
}
