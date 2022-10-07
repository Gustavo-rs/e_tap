class DataHorasAlunoModel {
  int? idStudent;
  int? idSubject;
  List<Dates>? dates;

  DataHorasAlunoModel({this.idStudent, this.idSubject, this.dates});

  DataHorasAlunoModel.fromJson(Map<String, dynamic> json) {
    idStudent = json['id_student'];
    idSubject = json['id_subject'];
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(new Dates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id_student'] = this.idStudent;
    data['id_subject'] = this.idSubject;
    if (this.dates != null) {
      data['dates'] = this.dates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dates {
  String? day;
  List<CallSequence>? callSequence;

  Dates({this.day, this.callSequence});

  Dates.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    if (json['call_sequence'] != null) {
      callSequence = <CallSequence>[];
      json['call_sequence'].forEach((v) {
        callSequence!.add(new CallSequence.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['day'] = this.day;
    if (this.callSequence != null) {
      data['call_sequence'] =
          this.callSequence!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CallSequence {
  int? sequence;
  String? callDate;
  String? callTime;

  CallSequence({this.sequence, this.callDate, this.callTime});

  CallSequence.fromJson(Map<String, dynamic> json) {
    sequence = json['sequence'];
    callDate = json['call_date'];
    callTime = json['call_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sequence'] = this.sequence;
    data['call_date'] = this.callDate;
    data['call_time'] = this.callTime;
    return data;
  }
}
