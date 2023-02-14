import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../common/constants/constants.dart';
import '../../common/views/custom_list_item_class.dart';
import '../../controllers/class_bloc/class_bloc.dart';
import '../../controllers/term_bloc/term_bloc.dart';
import '../../core/app_texts.dart';
import '../../models/class_model.dart';
import '../../models/term_model.dart';

class AddEditTermView extends StatelessWidget {
  AddEditTermView(
      {Key? key, required this.selectedTerm, required this.termBloc
        // , required this.classBloc
      })
      : super(key: key);

  final TermBloc termBloc;
  ClassBloc? classBloc = ClassBloc();
  final TermModel? selectedTerm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: wholeBody(context));
  }

  Widget wholeBody(BuildContext context) {
    return Column(
      children: [
        Constants.littleSizeBox,
        // _dropdownButton(context),
        _classList(context),
        _saveData(context),
      ],
    );
  }

  Widget _saveData(BuildContext context) {
    return BlocBuilder<TermBloc, TermState>(
      bloc: termBloc,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 14,
          child: _saveButton(state, context),
        );
      },
    );
  }

  ElevatedButton _saveButton(TermState state, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (termBloc.editeTerm(selectedTerm!, state.termClassList)) {
            termBloc.getTermUnits(selectedTerm!);
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppTexts.classLimitationMsg)));
          }
        },
        child: Text(AppTexts.saveButtonTxt));
  }

  // Future<dynamic> _backHomePage(
  //     BuildContext context, TermPageProvider provider) {
  //   return Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => HomeView(),
  //       ));
  // }

  // Widget _dropdownButton(BuildContext context) {
  //   bool helper = false;
  //   return Consumer<TermPageProvider>(builder: (context, provider, child) {
  //     return Container(
  //         margin: const EdgeInsets.all(10),
  //         color: Colors.white,
  //         width: MediaQuery.of(context).size.width,
  //         child: DropdownButtonHideUnderline(
  //           child: ButtonTheme(
  //             alignedDropdown: true,
  //             child: DropdownButton<TermModel>(
  //               hint: const Text('select term'),
  //               // if any term click to edit disable this button
  //               onChanged: selectedTerm == null
  //                   ? (TermModel? value) {
  //                       helper = true;
  //                       provider.selectedTerm = value!;
  //                     }
  //                   : null,
  //               value: !helper ? selectedTerm : provider.selectedTerm,
  //               items: provider.termList.map((TermModel item) {
  //                 return DropdownMenuItem<TermModel>(
  //                     value: item, child: Text(item.name!));
  //               }).toList(),
  //             ),
  //           ),
  //         ));
  //   });
  // }

  Widget _classList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      color: Colors.black45,
      height: MediaQuery.of(context).size.height / 1.6,
      child: ListView.builder(
        itemCount: classList.length,
        itemBuilder: (context, int index) {
          return _classListEditable(index);
        },
      ),
    );
  }

  Widget _classListEditable(int index) {
    return BlocBuilder<TermBloc, TermState>(
        bloc: termBloc,
        builder: (context, termState) {
          return BlocBuilder<ClassBloc, ClassState>(
            bloc: classBloc,
            builder: (context, classState) {
              List<ClassModel> classList = classState.classList;
              return CustomListItemClass(
                  isEditableActive: false,
                  onCheckbox: (checked) {
                    termBloc.add(SelectClassForTerm(
                        classList[index], checked!, termState.termClassList));
                  },
                  checkboxValue: termBloc.searchInClassOfTerm(
                      termState.termClassList, classList[index]),
                  unitNumber: classList[index].unitNumber!,
                  className: classList[index].className!,
                  teacherName: classList[index].teacherName!);
            },
          );
        });
  }
}
