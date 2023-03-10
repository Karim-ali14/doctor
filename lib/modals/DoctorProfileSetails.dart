class DoctorProfileDetails {
  String success;
  String register;
  MyData data;

  DoctorProfileDetails({this.success, this.register, this.data});

  DoctorProfileDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    register = json['register'];
    data = json['data'] != null ? new MyData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['register'] = this.register;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class MyData {
  int id;
  String name;
  String email;
  String aboutus;
  String address;
  String lat;
  String lon;
  String phoneno;
  String services;
  String healthcare;
  String image;
  String workingTime;
  String password;
  String facebookUrl;
  String twitterUrl;
  String createdAt;
  String updatedAt;
  String departmentName;
  int avgratting;
  String consultationFee;

  MyData(
      {this.id,
        this.name,
        this.email,
        this.aboutus,
        this.address,
        this.lat,
        this.lon,
        this.phoneno,
        this.services,
        this.healthcare,
        this.image,
        this.workingTime,
        this.password,
        this.facebookUrl,
        this.twitterUrl,
        this.createdAt,
        this.updatedAt,
        this.departmentName,
        this.avgratting,
        this.consultationFee});

  MyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    aboutus = json['aboutus'];
    address = json['address'];
    lat = json['lat'];
    lon = json['lon'];
    phoneno = json['phoneno'];
    services = json['services'];
    healthcare = json['healthcare'];
    image = json['image'];
    workingTime = json['working_time'];
    password = json['password'];
    facebookUrl = json['facebook_url'];
    twitterUrl = json['twitter_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    departmentName = json['department_name'];
    avgratting = json['avgratting'];
    consultationFee = json['consultation_fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['aboutus'] = this.aboutus;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['phoneno'] = this.phoneno;
    data['services'] = this.services;
    data['healthcare'] = this.healthcare;
    data['image'] = this.image;
    data['working_time'] = this.workingTime;
    data['password'] = this.password;
    data['facebook_url'] = this.facebookUrl;
    data['twitter_url'] = this.twitterUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['department_name'] = this.departmentName;
    data['avgratting'] = this.avgratting;
    return data;
  }
}
