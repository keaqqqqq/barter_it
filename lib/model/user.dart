class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? datereg;

  User({this.id, this.name, this.email, this.password, this.datereg});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    datereg = json['datereg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['datereg'] = datereg;
    return data;
  }
}
