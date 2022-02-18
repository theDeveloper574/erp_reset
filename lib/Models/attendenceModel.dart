import 'dart:convert';

AttendenceModel attendenceModelFromJson(String str) =>
    AttendenceModel.fromJson(json.decode(str));

String attendenceModelToJson(AttendenceModel data) =>
    json.encode(data.toJson());

class AttendenceModel {
  Data data;

  AttendenceModel({this.data});

  AttendenceModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  int userId;
  int businessId;
  String clockInTime;
  String clockOutTime;
  int essentialsShiftId;
  Null ipAddress;
  String clockInNote;
  String clockOutNote;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.userId,
      this.businessId,
      this.clockInTime,
      this.clockOutTime,
      this.essentialsShiftId,
      this.ipAddress,
      this.clockInNote,
      this.clockOutNote,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    businessId = json['business_id'];
    clockInTime = json['clock_in_time'];
    clockOutTime = json['clock_out_time'];
    essentialsShiftId = json['essentials_shift_id'];
    ipAddress = json['ip_address'];
    clockInNote = json['clock_in_note'];
    clockOutNote = json['clock_out_note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['business_id'] = this.businessId;
    data['clock_in_time'] = this.clockInTime;
    data['clock_out_time'] = this.clockOutTime;
    data['essentials_shift_id'] = this.essentialsShiftId;
    data['ip_address'] = this.ipAddress;
    data['clock_in_note'] = this.clockInNote;
    data['clock_out_note'] = this.clockOutNote;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
