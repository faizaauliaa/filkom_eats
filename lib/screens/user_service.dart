import 'package:shared_preferences/shared_preferences.dart';
import 'user_model.dart';

class UserService {
  // ================= GET USER =================
  static Future<UserModel> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final role = prefs.getString('role') ?? 'student';

    // ===== SELLER =====
    if (role == 'seller') {
      return UserModel(
        name: prefs.getString('storeName') ?? 'Warung Henny',
        phone: prefs.getString('phone') ?? '+62 812 0000 0000',
        email: '', // seller tidak pakai email
      );
    }

    // ===== STUDENT =====
    return UserModel(
      name: prefs.getString('name') ?? 'Aisha Maryam',
      phone: prefs.getString('phone') ?? '+62 812 0000 0001',
      email: prefs.getString('email') ?? 'aishmrym@student.ub.ac.id',
    );
  }

  // ================= SAVE USER (STUDENT) =================
  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', 'student');
    await prefs.setString('name', user.name);
    await prefs.setString('phone', user.phone);
    await prefs.setString('email', user.email);
  }

  // ================= SAVE SELLER =================
  static Future<void> saveSeller({
    required String storeName,
    required String phone,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', 'seller');
    await prefs.setString('storeName', storeName);
    await prefs.setString('phone', phone);
  }

  // ================= LOGOUT =================
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
