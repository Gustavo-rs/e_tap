class ListaAlunosMateria {
  String? subject;
  List<Students>? students;

  ListaAlunosMateria({this.subject, this.students});

  ListaAlunosMateria.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['subject'] = this.subject;
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  String? fullName;
  String? email;

  Students({this.fullName, this.email});

  Students.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    return data;
  }
}
