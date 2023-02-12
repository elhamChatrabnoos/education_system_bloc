import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:education_system_bloc/models/term_model.dart';
import 'package:meta/meta.dart';

import '../../models/class_model.dart';

part 'term_event.dart';

part 'term_state.dart';

class TermBloc extends Bloc<TermEvent, TermState> {
  TermBloc() : super(TermInitial()) {
    on<AddTerm>(_onAddTerm);
    on<RemoveTerm>(_onRemoveTerm);
  }

  FutureOr<bool> _onAddTerm(AddTerm event, Emitter<TermState> emit) async{
    List<ClassModel> classList = [];
    // search in termList to check target term for add
    for (int i = 0; i < state.termList.length + 1; i++) {
      state.termAddSuccess = false;
      bool thereIs = false;
      TermModel termModel =
          TermModel(termName: 'Term ${i + 1}', termClassList: classList);
      for (var j = 0; j < state.termList.length; j++) {
        if (state.termList[j].termName == termModel.termName) {
          thereIs = true;
          break;
        }
      }
      if (!thereIs) {
        if (i < 10) {
          emit(TermState(List.from(state.termList)..add(termModel)));
          state.termAddSuccess = true;
          print('success: ${state.termAddSuccess}');
          return state.termAddSuccess;
        }
      }
    }
    return false;
  }

  FutureOr<void> _onRemoveTerm(RemoveTerm event, Emitter<TermState> emit) {
    emit(TermState(List.from(state.termList)..remove(event.termModel)));
  }
}
