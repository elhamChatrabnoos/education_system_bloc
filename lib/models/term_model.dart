import 'class_model.dart';

class TermModel {
  String? termName;
  List<ClassModel>? termClassList;

  TermModel({this.termName, this.termClassList});

  TermModel copyWith({
    String? termName,
    List<ClassModel>? termClassList,
  }) {
    return TermModel(
      termName: termName ?? this.termName,
      termClassList: termClassList ?? this.termClassList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "termName": termName,
      "termClassList": termClassList!.map((i) => i.toJson()).toList(),
    };
  }

  factory TermModel.fromJson(Map<String, dynamic> json) {
    return TermModel(
        termName: json["termName"],
        termClassList: List.of(json["termClassList"]));
  }

  @override
  List<Object> get props => [
        termName!,
        termClassList!,
      ];
}


List<TermModel> termList = [
  TermModel(termName: 'Term 1', termClassList: []),
  TermModel(termName: 'Term 2', termClassList: []),
  TermModel(termName: 'Term 3', termClassList: []),
  TermModel(termName: 'Term 4', termClassList: []),
];
