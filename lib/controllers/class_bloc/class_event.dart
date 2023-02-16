part of 'class_bloc.dart';

@immutable
abstract class ClassEvent {}

class AddClass extends ClassEvent {
  final ClassModel classModel;
  AddClass({required this.classModel});
}

class RemoveClass extends ClassEvent {
  final ClassModel classModel;
  RemoveClass(this.classModel);
}

class UpdateClass extends ClassEvent {
  final ClassModel classModel;
  final int classIndex;
  UpdateClass(this.classModel, this.classIndex);
}

class EditClass extends ClassEvent {}
