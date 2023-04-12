part of 'term_bloc.dart';

@immutable
abstract class TermEvent {}

class AddTerm extends TermEvent {
  AddTerm();
}

class RemoveTerm extends TermEvent {
  final TermModel termModel;
  RemoveTerm(this.termModel);
}

class SelectClassForTerm extends TermEvent {
  final ClassModel classModel;
  final bool isChecked;
  List<ClassModel> classListOfTerm;

  SelectClassForTerm(this.classModel, this.isChecked, this.classListOfTerm);
}
