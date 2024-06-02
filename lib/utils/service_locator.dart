import 'package:assessment/service/company_service.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingletonAsync<Database>(
    () async {
      return await openDatabase(
          join(await getDatabasesPath(), 'specno_offices.db'),
          version: 2, onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE companies(id TEXT PRIMARY KEY, name TEXT, address TEXT, email TEXT, capacity INTEGER, color TEXT, phone TEXT)');
        await db.execute(
          'CREATE TABLE users(id TEXT PRIMARY KEY, name TEXT, avatar TEXT, companyId TEXT, FOREIGN KEY(companyId) REFERENCES companies(id))',
        );
      }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (oldVersion <= 2) {
          await db.execute(
            'ALTER TABLE companies ADD COLUMN phone TEXT',
          );
        }
      });
    },
  );

  // getIt.registerSingleton<CompanyService>(CompanyService());
}
