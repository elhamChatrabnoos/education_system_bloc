import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:education_system_bloc/models/class_model.dart';
import 'package:meta/meta.dart';

part 'class_event.dart';

part 'class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {

  ClassBloc() : super(ClassInitial()) {
    on<RemoveClass>(_onRemoveClass);
    on<AddClass>(_onAddClass);
    on<UpdateClass>(_onUpdateClass);
  }


  FutureOr<void> _onRemoveClass(RemoveClass event, Emitter<ClassState> emit) {
    classList = state.classList;
    classList.remove(event.classModel);
    // emit(ClassState(List.from(classList)..remove(event.classModel)));
    emit(ClassState(classList));
  }

  FutureOr<void> _onAddClass(AddClass event, Emitter<ClassState> emit) {
    classList = state.classList;
    classList.add(event.classModel);
    // emit(ClassState(List.from(classList)..add(event.classModel)));
    emit(ClassState(classList));
  }

  FutureOr<void> _onUpdateClass(UpdateClass event, Emitter<ClassState> emit) {
    classList = state.classList;
    classList[event.classIndex] = event.classModel;
    emit(ClassState(classList));
  }


}
