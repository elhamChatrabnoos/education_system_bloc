import 'package:education_system_bloc/controllers/class_bloc/class_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../common/views/custom_dialog.dart';
import '../../common/views/custom_list_item_class.dart';
import '../../core/constants.dart';
import '../../models/class_model.dart';

class ClassPage extends StatelessWidget {
   ClassPage({Key? key}) : super(key: key);

   ClassBloc classBloc = ClassBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassBloc, ClassState>(
      bloc: classBloc,
      builder: (context, state) {
        return Scaffold(
          body: _listViewItems(state),
          floatingActionButton: _floatingButtonClick(context, state),
        );
      },
    );
  }

  Widget _floatingButtonClick(BuildContext context, ClassState state) {
    return FloatingActionButton(
      onPressed: () => _showAddDialog(context, state),
      backgroundColor: Constants.primaryColor,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  ListView _listViewItems(ClassState state) {
    List<ClassModel> classList = state.classList;
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: classList.length,
      itemBuilder: (context, index) {
        return CustomListItemClass(
          checkboxValue: classList[index].classSelected!,
          unitNumber: classList[index].unitNumber!,
          className: classList[index].className!,
          teacherName: classList[index].teacherName!,
          onDeleteTap: () => classBloc.add(RemoveClass(classList[index])),
          onEditTap: () => _showEditDialog(context, index, state),
        );
      },
    );
  }

  Future<void> _showAddDialog(BuildContext context, ClassState state) {
    return showDialog(
      context: context,
      builder: (_) => CustomDialog(isAddAction: true),
    ).then((value) {
      ClassModel newClass = ClassModel(
          className: value['className'],
          unitNumber: value['classUnit'],
          teacherName: value['teacherName'],
          classSelected: false);
      classBloc.add(AddClass(classModel: newClass));
    });
  }

Future<void> _showEditDialog(
    BuildContext context, int index, ClassState state) {
  List<ClassModel> classList = state.classList;
  return showDialog(
      context: context,
      builder: (context) => CustomDialog(
            isAddAction: false,
            className: classList[index].className,
            classTeacher: classList[index].teacherName,
            classUnit: classList[index].unitNumber,
          )).then((value) {
    ClassModel editedClass = ClassModel(
      className: value['className'],
      unitNumber: value['classUnit'],
      teacherName: value['teacherName'],
      classSelected: false);

    classBloc.add(UpdateClass(editedClass, index));
  });
}
}
