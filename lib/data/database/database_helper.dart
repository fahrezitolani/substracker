import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/subscription_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('substracker.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE subscriptions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        cost REAL NOT NULL,
        billingCycle TEXT NOT NULL,
        nextBillingDate TEXT NOT NULL,
        category TEXT NOT NULL,
        icon TEXT,
        paymentMethod TEXT,
        notes TEXT
      )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE subscriptions ADD COLUMN paymentMethod TEXT');
      await db.execute('ALTER TABLE subscriptions ADD COLUMN notes TEXT');
    }
  }

  Future<SubscriptionModel> createSubscription(SubscriptionModel subscription) async {
    final db = await instance.database;
    final id = await db.insert('subscriptions', subscription.toMap());
    return subscription.copyWith(id: id);
  }

  Future<List<SubscriptionModel>> readAllSubscriptions() async {
    final db = await instance.database;
    final result = await db.query('subscriptions');
    return result.map((json) => SubscriptionModel.fromMap(json)).toList();
  }

  Future<int> updateSubscription(SubscriptionModel subscription) async {
    final db = await instance.database;
    return db.update(
      'subscriptions',
      subscription.toMap(),
      where: 'id = ?',
      whereArgs: [subscription.id],
    );
  }

  Future<int> deleteSubscription(int id) async {
    final db = await instance.database;
    return await db.delete(
      'subscriptions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
