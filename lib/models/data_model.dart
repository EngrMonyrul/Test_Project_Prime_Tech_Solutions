class Data {
  int? id;
  String? name;
  String? email;
  String? token;

  Data({this.id, this.name, this.email, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    email = json['Email'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Token'] = this.token;
    return data;
  }
}
