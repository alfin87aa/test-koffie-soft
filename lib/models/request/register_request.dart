import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  RegisterRequest({
    required this.email,
    required this.hp,
    required this.firstname,
    required this.lastname,
    required this.grup,
    required this.role,
    required this.tglLahir,
    required this.jenisKelamin,
    required this.password,
    this.referralCode,
  });

  String email;
  String hp;
  String firstname;
  String lastname;
  String grup;
  String role;
  DateTime tglLahir;
  int jenisKelamin;
  String password;
  String? referralCode = '';

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        email: json["email"],
        hp: json["hp"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        grup: json["grup"],
        role: json["role"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        password: json["password"],
        referralCode: json["referral_code"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "hp": hp,
        "firstname": firstname,
        "lastname": lastname,
        "grup": grup,
        "role": role,
        "tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "password": password,
        "referral_code": referralCode,
      };
}
