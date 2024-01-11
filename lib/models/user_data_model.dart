class UserData {
  int? id;
  String? name;
  String? email;
  String? profilepicture;
  String? location;
  String? createdat;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.profilepicture,
      this.location,
      this.createdat});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilepicture = json['profilepicture'];
    location = json['location'];
    createdat = json['createdat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profilepicture'] = this.profilepicture;
    data['location'] = this.location;
    data['createdat'] = this.createdat;
    return data;
  }
}
