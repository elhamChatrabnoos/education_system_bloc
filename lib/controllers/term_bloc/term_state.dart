part of 'term_bloc.dart';

class TermState {
  List<TermModel> termList = [];
  List<ClassModel> termClassList = [];

  TermState(this.termList);

  TermState.classConstructor(this.termClassList);

  bool termAddSuccess = false;
}

class TermInitial extends TermState {
  TermInitial() : super(termList);
}
