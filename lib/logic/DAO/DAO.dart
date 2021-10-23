import 'package:login_password_encrypted/logic/models/customer.dart';
import 'package:login_password_encrypted/logic/models/mysql.dart';

/// DAO == Data Access Object
/// Here we got the connection between the app and the database

class DAO {
  Mysql db = new Mysql();

  DAO();

  Future<List<Customer>> getCustomers() async {
    List<Customer> result = [];
    db.getConnection().then((conn) {
      String sql = 'select * from symptomchecker.users;';
      conn.query(sql).then((results) {
        for (var row in results) {
          result.add(
              new Customer.db(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7],row[8]));
        }
      }, onError: (error){
        print('$error');
      }).whenComplete(() {
        conn.close();
      });
    });
    return result;
  }

  Future<void> insertCustomer(Customer customer) async {
    db.getConnection().then((conn) {
      String sql =
          'insert into symptomchecker.users (username, firstname, lastname, mail, bio, usertype, language, password) values(?, ?, ?, ?, ?, ?, ?, ?)';
      conn.query(sql, [
        customer.username,
        customer.firstname,
        customer.lastname,
        customer.mail,
        customer.bio,
        customer.usertype,
        customer.language,
        customer.hash
      ]).then((results) {
        print('Inserted customer succesfullly');
      }, onError: (error) {
        print('$error');
      }).whenComplete(() {
        conn.close();
      });
    });
  }
}
