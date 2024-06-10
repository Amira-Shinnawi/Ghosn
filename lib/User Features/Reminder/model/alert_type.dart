class Alert {
  String title; // Make sure to initialize or make it required
  String note;
  DateTime dateTime;
  String alertType; // 'daily', 'weekly', 'monthly'
  String alertIcon; // This can be the asset reference for the icon

  // Mark the `title` parameter as required
  Alert({
    required this.title,
    this.note = '',
    required this.dateTime,
    required this.alertType,
    required this.alertIcon,
  });




  // Convert a Alert object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'note': note,
      'dateTime': dateTime.toIso8601String(),
      'alertType': alertType,
      'alertIcon': alertIcon,
    };
  }

  // Extract a Alert object from a Map object
  factory Alert.fromMap(Map<String, dynamic> map) {
    return Alert(
      title: map['title'],
      note: map['note'],
      dateTime: DateTime.parse(map['dateTime']),
      alertType: map['alertType'],
      alertIcon: map['alertIcon'],
    );
  }
}


