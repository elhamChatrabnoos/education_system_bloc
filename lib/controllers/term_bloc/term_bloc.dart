import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:education_system_bloc/models/term_model.dart';
import 'package:meta/meta.dart';

import '../../models/class_model.dart';

part 'term_event.dart';

part 'term_state.dart';

class TermBloc extends Bloc<TermEvent, TermState> {
  TermBloc() : super(TermInitial()) {
    on<RemoveTerm>(_onRemoveTerm);
    on<SelectClassForTerm>(_onSelectClassForTerm);
  }

  bool onAddTerm() {
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
          return state.termAddSuccess;
        }
      }
    }
    return false;
  }

  FutureOr<void> _onRemoveTerm(RemoveTerm event, Emitter<TermState> emit) {
    emit(TermState(List.from(state.termList)..remove(event.termModel)));
  }

  FutureOr<void> _onSelectClassForTerm(
      SelectClassForTerm event, Emitter<TermState> emit) {
    int index = state.termClassList.indexOf(event.classModel);
    if (index >= 0) {
      if (!event.isChecked) {
        emit(TermState.classConstructor(
            List.from(state.termClassList)..remove(event.classModel)));
      }
    } else {
      emit(TermState.classConstructor(
          List.from(state.termClassList)..add(event.classModel)));
    }
  }


  bool searchInClassOfTerm(
      List<ClassModel> classOfTerm, ClassModel classModel) {
    return state.termClassList.contains(classModel);
  }

  bool editeTerm(TermModel term, List<ClassModel> classList) {
    int unitNumber = 0;
    for (int i = 0; i < classList.length; ++i) {
      unitNumber += classList[i].unitNumber!;
    }
    //// if selected unit is more than 12 or lower than 20 unit save it
    if (unitNumber >= 12 && unitNumber <= 20) {
      term.termClassList = classList;
      // notifyListeners();
      return true;
    }
    return false;
  }

  List<ClassModel> getClassOfTerm(List<ClassModel> classList) {
    List<ClassModel> listOfClass = [];

    for (int i = 0; i < classList.length; i++) {
      listOfClass.add(classList[i]);
    }
    return listOfClass;
  }

  int getTermUnits(TermModel termModel) {
    int termUnits = 0;
    for (var i = 0; i < termModel.termClassList.length; ++i) {
      termUnits += termModel.termClassList[i].unitNumber!;
    }
    return termUnits;
  }

}
