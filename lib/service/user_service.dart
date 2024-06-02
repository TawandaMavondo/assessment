import 'package:assessment/dto/user_dto.dart';
import 'package:assessment/home.dart';
import 'package:sqflite/sqflite.dart';

class UserService {
  final Database _db = getIt<Database>();

  Future<int> createUser(Map<String, dynamic> user) async {
    return await _db.insert('users', user);
  }

  Future<List<Map<String, dynamic>>> readUsers() async {
    return await _db.query('users');
  }

  Future<int> updateUser(String id, Map<String, dynamic> user) async {
    return await _db.update('users', user, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteUser(String id) async {
    return await _db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<UserDto>> getUsersByCompanyId(String companyId) async {
    var users = await _db
        .query('users', where: 'companyId = ?', whereArgs: [companyId]);
    return users.map((user) => UserDto.fromMap(user)).toList();
  }
}
