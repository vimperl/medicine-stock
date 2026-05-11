enum TimeSlot {
  morning,
  noon,
  evening,
  night;

  String get key => name;

  static TimeSlot fromKey(String key) {
    return TimeSlot.values.firstWhere(
      (s) => s.name == key,
      orElse: () => TimeSlot.morning,
    );
  }
}

enum PurchaseMode {
  boxes,
  tablets;

  String get key => name;

  static PurchaseMode fromKey(String key) {
    return PurchaseMode.values.firstWhere(
      (m) => m.name == key,
      orElse: () => PurchaseMode.tablets,
    );
  }
}

const dayNamesShortLatn = ['Pon', 'Uto', 'Sre', 'Cet', 'Pet', 'Sub', 'Ned'];
const dayNamesShortCyrl = ['Пон', 'Уто', 'Сре', 'Чет', 'Пет', 'Суб', 'Нед'];
const dayNamesShortEn = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
