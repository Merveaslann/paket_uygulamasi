class UserO {
  final String uid;
  final String name;
  final String surname;
  final String tckn;
  final String email;
  final signupdate;
  List<String> travels;

  UserO(this.uid, this.name, this.surname, this.tckn, this.email, this.signupdate, {this.travels  = const []});

  UserO.fromMap(Map<String, dynamic> map) : this (
      map["uid"], map["name"], map["surname"], map["tckn"], map["email"], map["signupdate"], travels: map["travels"]
  );

  Map<String, dynamic> toMap(){
    return {
      "uid": uid,
      "name": name,
      "surname": surname,
      "tckn": tckn,
      "email": email,
      "signupdate": signupdate,
      "travels": travels
    };
  }
}