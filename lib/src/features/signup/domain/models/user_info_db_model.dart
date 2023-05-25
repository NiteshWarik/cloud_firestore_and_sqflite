class UserInfoDBModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  int? isUploaded;

  UserInfoDBModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.isUploaded});

  UserInfoDBModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    isUploaded = json['is_uploaded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['is_uploaded'] = this.isUploaded;
    return data;
  }

  // Convert the User object to a Map object
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['is_uploaded'] = isUploaded;
    return data;
  }
}
