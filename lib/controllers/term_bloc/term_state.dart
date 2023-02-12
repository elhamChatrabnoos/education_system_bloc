part of 'term_bloc.dart';

class TermState {
  List<TermModel> termList = [];

  TermState(this.termList);
  List<Object> get props => [termList];

  bool termAddSuccess = false;
}

class TermInitial extends TermState {
  TermInitial() : super(termList);
}
