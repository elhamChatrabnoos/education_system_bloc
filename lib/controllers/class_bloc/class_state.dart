part of 'class_bloc.dart';

class ClassState {

  List<ClassModel> classList = [];

  ClassState(this.classList);

  List<Object> get props => [classList];
}

class ClassInitial extends ClassState {
  ClassInitial() : super(classList);
}


