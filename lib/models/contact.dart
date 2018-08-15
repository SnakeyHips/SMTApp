class Contact {
  final String name;
  final String title;
  final String number;
  final String altNumber;
  final String shortCode;

  Contact.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        title = json['title'],
        number = json['number'],
        altNumber = json['altNumber'],
        shortCode = json['shortCode'];
}
