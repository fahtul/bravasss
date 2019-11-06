class ResponseLogin {
  bool error;
  String uid;
  User user;

  ResponseLogin({this.error, this.uid, this.user});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    uid = json['uid'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['uid'] = this.uid;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String nama;
  String email;

  User({this.nama, this.email});

  User.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['email'] = this.email;
    return data;
  }
}