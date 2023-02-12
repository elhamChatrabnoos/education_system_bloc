class ClassModel{
  String? className;
  int? unitNumber;
  String? teacherName;
  bool? classSelected;

  ClassModel({
    this.className,
    this.unitNumber,
    this.teacherName,
    this.classSelected});

  ClassModel copyWith({String? className,
    int? unitNumber,
    String? teacherName,
    bool? classSelected}) {
    return ClassModel(
        className: className ?? this.className,
        unitNumber: unitNumber ?? this.unitNumber,
        teacherName: teacherName ?? this.teacherName,
        classSelected: classSelected ?? this.classSelected);
  }

  Map<String, dynamic> toJson() {
    return {
      "className": className,
      "unitNumber": unitNumber,
      "teacherName": teacherName,
      "classSelected": classSelected,
    };
  }

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      className: json["className"],
      unitNumber: int.parse(json["unitNumber"]),
      teacherName: json["teacherName"],
      classSelected: json["classSelected"].toLowerCase() == 'true',
    );
  }

  @override
  List<Object> get props => [
    className!,
    unitNumber!,
    teacherName!,
    classSelected!,
  ];


}

List<ClassModel> classList = [
  ClassModel(
      className: 'Artificial Intelligent',
      unitNumber: 5,
      teacherName: 'Elon Musk',
      classSelected: false),
  ClassModel(
      className: 'Mathematics',
      unitNumber: 5,
      teacherName: 'Jack ma',
      classSelected: false),
  ClassModel(
      className: 'Web Design',
      unitNumber: 5,
      teacherName: 'Jeff bezos',
      classSelected: false)
];
