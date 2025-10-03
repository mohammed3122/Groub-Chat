class UserModel {
  final String fristName;
  final String endName;
  final String phoneNumber;
  final String age;
  final String email;

  UserModel({
    required this.fristName,
    required this.endName,
    required this.age,
    required this.email,
    required this.phoneNumber,
  });
  factory UserModel.fromjson(json) {
    return UserModel(
      fristName: json['fristName'],
      endName: json['endName'],
      age: json['age'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
