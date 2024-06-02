import 'package:assessment/dto/company_dto.dart';
import 'package:assessment/utils/service_locator.dart';
import 'package:sqflite/sqflite.dart';

class CompanyService {
  final Database _db = getIt<Database>();

  Future<int> createCompany(Map<String, dynamic> company) async {
    return await _db.insert(
      'companies',
      company,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CompanyDTO>> readCompanies() async {
    var companies = await _db.query('companies');
    return companies.map((company) => CompanyDTO.fromMap(company)).toList();
  }

  Future<int> updateCompany(String id, Map<String, dynamic> company) async {
    return await _db
        .update('companies', company, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteCompany(String id) async {
    return await _db.delete('companies', where: 'id = ?', whereArgs: [id]);
  }
  
}
