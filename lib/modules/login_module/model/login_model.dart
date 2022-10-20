class LoginModel {
  String? status;
  String? nome;
  String? token;
  int? id;
  int? permission;

  LoginModel({this.status, this.nome, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    nome = json['nome'];
    token = json['token'];
    id = json['id'];
    permission = json['permission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['nome'] = this.nome;
    data['token'] = this.token;
    data['id'] = this.id;
    data['permission'] = this.permission;
    return data;
  }
}
