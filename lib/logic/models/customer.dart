import 'package:password/password.dart';

class Customer {
  int id;
  String username, firstname, lastname, mail, bio, usertype, language, hash;
  PBKDF2 algorithm;

  Customer(
      this.username, this.firstname, this.lastname, this.mail,this.bio,this.usertype,this.language, String password) {
    algorithm = new PBKDF2();
    hash = Password.hash(password, algorithm);
  }

  Customer.db(
      this.id, this.username, this.firstname, this.lastname, this.mail,this.bio,this.usertype,this.language, this.hash) {
    algorithm = new PBKDF2();
  }

  Customer.def() {
    id = null;
    username = '';
    firstname = '';
    lastname = '';
    mail = '';
    bio = '';
    usertype='';
    language='';
    hash = '';
    algorithm = new PBKDF2();
  }

  bool passwordVerify(String password) {
    return Password.verify(password, hash);
  }
}
