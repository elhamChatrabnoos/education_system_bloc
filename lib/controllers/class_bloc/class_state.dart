part of 'class_bloc.dart';

class ClassState {

  List<ClassModel> classList = [];
  bool itemDeleted = false;

  ClassState(this.classList);

  @override
  List<Object> get props => [classList];
}

class ClassInitial extends ClassState {
  ClassInitial() : super(classList);
}


