import 'package:pretestpts/models/user_data_model.dart';

class UserDetails {
  int? page;
  int? perPage;
  int? totalrecord;
  int? totalPages;
  List<UserData>? data;

  UserDetails(
      {this.page, this.perPage, this.totalrecord, this.totalPages, this.data});

  UserDetails.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    totalrecord = json['totalrecord'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) {
        data!.add(new UserData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['totalrecord'] = this.totalrecord;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

