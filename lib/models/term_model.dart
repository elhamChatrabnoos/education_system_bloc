import 'class_model.dart';

class TermModel {
  String? termName;
  List<ClassModel> _termClassList;


  set termClassList(List<ClassModel> value) {
    _termClassList = value;
  }

  List<ClassModel> get termClassList => _termClassList;

  TermModel({this.termName, List<ClassModel>? termClassList}) :
        _termClassList = termClassList!;


  Map<String, dynamic> toJson() {
    return {
      "termName": termName,
      "termClassList": _termClassList.map((i) => i.toJson()).toList(),
    };
  }

  factory TermModel.fromJson(Map<String, dynamic> json) {
    return TermModel(
        termName: json["termName"],
        termClassList: List.of(json["termClassList"]));
  }

}


List<TermModel> termList = [
  TermModel(termName: 'Term 1', termClassList: []),
  TermModel(termName: 'Term 2', termClassList: []),
  TermModel(termName: 'Term 3', termClassList: []),
  TermModel(termName: 'Term 4', termClassList: []),
];
