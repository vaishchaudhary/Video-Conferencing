import 'package:intl/intl.dart';

class MeetingData {
  Body? body;
  String? status;
  String? error;
  MeetingData({this.body, this.status,this.error});

  MeetingData.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Body {
  List<Meetings>? meetings;

  Body({this.meetings});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['meetings'] != null) {
      meetings = <Meetings>[];
      json['meetings'].forEach((v) {
        meetings!.add(new Meetings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meetings != null) {
      data['meetings'] = this.meetings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meetings {
  int? id;
  String? userId;
  String? meetingId;
  String? name;
  String? description;
  String? status;
  String? streamChannel;
  String? streamToken;
  String? startsAt;
  String? endsAt;
  String? repeats;
  String? disableVideo;
  String? disableAudio;
  String? createdAt;
  String? updatedAt;
  String? startTime;
  String? endTime;
  Meetings(
      {this.id,
        this.userId,
        this.meetingId,
        this.name,
        this.description,
        this.status,
        this.streamChannel,
        this.streamToken,
        this.startsAt,
        this.endsAt,
        this.repeats,
        this.disableVideo,
        this.disableAudio,
        this.createdAt,
        this.updatedAt,
        this.startTime,
        this.endTime
      });

  Meetings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    meetingId = json['meeting_id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    streamChannel = json['stream_channel'];
    streamToken = json['stream_token'];
    startsAt = json['starts_at'];
    endsAt = json['ends_at'];
    repeats = json['repeats'];
    disableVideo = json['disable_video'];
    disableAudio = json['disable_audio'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if(startsAt!=null)
    startTime = DateFormat.jm().format(DateTime.parse(startsAt!));
    if(endsAt!=null)
      endTime = DateFormat.jm().format(DateTime.parse(endsAt!));

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['meeting_id'] = this.meetingId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['status'] = this.status;
    data['stream_channel'] = this.streamChannel;
    data['stream_token'] = this.streamToken;
    data['starts_at'] = this.startsAt;
    data['ends_at'] = this.endsAt;
    data['repeats'] = this.repeats;
    data['disable_video'] = this.disableVideo;
    data['disable_audio'] = this.disableAudio;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
