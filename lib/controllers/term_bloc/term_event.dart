part of 'term_bloc.dart';

@immutable
abstract class TermEvent {}

class AddTerm extends TermEvent{
  AddTerm();
}

class RemoveTerm extends TermEvent{
  final TermModel termModel;
  RemoveTerm(this.termModel);

  List<Object> get props => [termModel];
}










