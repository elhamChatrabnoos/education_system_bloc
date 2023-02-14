import 'package:education_system_bloc/controllers/term_bloc/term_bloc.dart';
import 'package:education_system_bloc/views/term_pages/add_edit_term_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/constants.dart';
import '../../common/views/custom_list_item.dart';
import '../../core/app_texts.dart';

class TermPage extends StatelessWidget {
  TermPage({Key? key}) : super(key: key);

  TermBloc termBloc = TermBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermBloc, TermState>(
      bloc: termBloc,
      builder: (context, state) {
        return Scaffold(
            body: _listOfTerms(state),
            floatingActionButton: _floatingButton(context, state));
      },
    );
  }

  Widget _floatingButton(BuildContext context, TermState state) {
    return FloatingActionButton(
      onPressed: () {
        if (!termBloc.onAddTerm()) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(AppTexts.extraTermMsg)));
        }
      },
      backgroundColor: Constants.primaryColor,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _listOfTerms(TermState state) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.90,
      ),
      itemCount: state.termList.length,
      itemBuilder: (context, index) {
        return _eachTermItem(state, index, context);
      },
    );
  }

  Widget _eachTermItem(TermState state, int index, BuildContext context) {
    return InkWell(
      child: CustomListItem(
          onDeleteTap: () => termBloc.add(RemoveTerm(state.termList[index])),
          textName: state.termList[index].termName!,
          classNumber: termBloc.getTermUnits(state.termList[index]).toString()),
      onTap: () {
        state.termClassList =
            termBloc.getClassOfTerm(state.termList[index].termClassList);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddEditTermPage(
                      termBloc: termBloc,
                      selectedTerm: state.termList[index],
                    )));
      },
    );
  }
}
