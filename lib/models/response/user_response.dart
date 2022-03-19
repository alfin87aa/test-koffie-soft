class User {
  User({
    required this.id,
    required this.email,
    required this.hp,
    required this.firstname,
    required this.lastname,
    required this.grup,
    required this.tglLahir,
    required this.jenisKelamin,
    required this.referralCode,
    required this.status,
    required this.accountStatus,
    required this.photo,
    required this.toko,
    required this.role,
    required this.referredBy,
    required this.statusBlokir,
  });

  int id;
  String email;
  String hp;
  String firstname;
  String lastname;
  String grup;
  DateTime tglLahir;
  AccountStatus jenisKelamin;
  String referralCode;
  AccountStatus status;
  AccountStatus accountStatus;
  Photo photo;
  dynamic toko;
  dynamic role;
  dynamic referredBy;
  dynamic statusBlokir;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        hp: json["hp"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        grup: json["grup"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        jenisKelamin: AccountStatus.fromJson(json["jenis_kelamin"]),
        referralCode: json["referral_code"],
        status: AccountStatus.fromJson(json["status"]),
        accountStatus: AccountStatus.fromJson(json["account_status"]),
        photo: Photo.fromJson(json["photo"]),
        toko: json["toko"],
        role: json["role"],
        referredBy: json["referred_by"],
        statusBlokir: json["status_blokir"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "hp": hp,
        "firstname": firstname,
        "lastname": lastname,
        "grup": grup,
        "tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin.toJson(),
        "referral_code": referralCode,
        "status": status.toJson(),
        "account_status": accountStatus.toJson(),
        "photo": photo.toJson(),
        "toko": toko,
        "role": role,
        "referred_by": referredBy,
        "status_blokir": statusBlokir,
      };
}

class AccountStatus {
  AccountStatus({
    required this.kode,
    required this.keterangan,
  });

  int kode;
  String keterangan;

  factory AccountStatus.fromJson(Map<String, dynamic> json) => AccountStatus(
        kode: json["kode"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "keterangan": keterangan,
      };
}

class Photo {
  Photo({
    required this.id,
    required this.filename,
    required this.caption,
    required this.width,
    required this.height,
    required this.contentType,
    required this.storage,
    required this.uri,
  });

  int id;
  String filename;
  String caption;
  int width;
  int height;
  String contentType;
  String storage;
  String uri;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        filename: json["filename"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        contentType: json["content_type"],
        storage: json["storage"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filename": filename,
        "caption": caption,
        "width": width,
        "height": height,
        "content_type": contentType,
        "storage": storage,
        "uri": uri,
      };
}
