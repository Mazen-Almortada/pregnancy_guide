class Item {
  String title;
  bool isChecked;
  String type;
  Item({
    required this.title,
    this.isChecked = false,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isChecked': isChecked,
      'type': type,
    };
  }

  factory Item.fromMap(dynamic map) {
    return Item(
      title: map['title'] as String,
      isChecked: map['isChecked'] as bool,
      type: map['type'] as String,
    );
  }
}

List<Item> _initMomEquipment = [
  Item(title: "مستلزمات النظافة الشخصية", type: "مغادرة المستشفى"),
  Item(title: "فوط نسائية", type: "مغادرة المستشفى"),
  Item(title: "هوية الأم", type: "قبل الولادة"),
  Item(title: "مرطب الشفاة", type: "قبل الولادة"),
  Item(title: "غطاء رأس", type: "قبل الولادة"),
  Item(title: "جوارب", type: "قبل الولادة"),
  Item(title: "طقم العناية", type: "قبل الولادة"),
  Item(title: "مناديل مبللة", type: "بعد الولادة"),
  Item(title: "منشفة", type: "بعد الولادة"),
  Item(title: "مضخة حليب الثدي", type: "بعد الولادة"),
  Item(title: "صابون الطفل", type: "بعد الولادة"),
  Item(title: "قطن", type: "بعد الولادة"),
];
List<Item> _initFetusEquipment = [
  Item(title: "شهادة الميلاد", type: "مغادرة المستشفى"),
  Item(title: "قطعة قماش للتغطية", type: "مغادرة المستشفى"),
  Item(title: "حفاضات", type: "مغادرة المستشفى"),
  Item(title: "بطانية و ملابس للطفل", type: "مغادرة المستشفى"),
  Item(title: "سرير", type: "قبل الولادة"),
  Item(title: "بطانية", type: "قبل الولادة"),
  Item(title: "فرشة للسرير", type: "قبل الولادة"),
  Item(title: "وسادات قطنية", type: "بعد الولادة"),
  Item(title: "بودرة الطفل", type: "بعد الولادة"),
  Item(title: "صابون سائل للأطفال", type: "بعد الولادة"),
  Item(title: "مصاصة", type: "بعد الولادة"),
  Item(title: "لعبة مهدئة", type: "بعد الولادة"),
];

List momEquipmentToJson =
    _initMomEquipment.map((item) => item.toMap()).toList();
List fetusEquipmentToJson =
    _initFetusEquipment.map((item) => item.toMap()).toList();
