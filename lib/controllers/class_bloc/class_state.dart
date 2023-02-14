part of 'class_bloc.dart';

class ClassState {

  List<ClassModel> classList = [];
  ClassState(this.classList);

  // ClassState.unNamedCons();
}

class ClassInitial extends ClassState {
  ClassInitial() : super(classList);
  // ClassInitial.emptyConst() : super.unNamedCons();
}


