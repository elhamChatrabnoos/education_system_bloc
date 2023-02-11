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
    emit(ClassState(List.from(state.classList)..remove(event.classModel)));
  }

  FutureOr<void> _onAddClass(AddClass event, Emitter<ClassState> emit) {
    emit(ClassState(List.from(state.classList)..add(event.classModel)));
  }

  FutureOr<void> _onUpdateClass(UpdateClass event, Emitter<ClassState> emit) {
    state.classList[event.classIndex] = event.classModel;
    emit(ClassState(state.classList));
  }


}
