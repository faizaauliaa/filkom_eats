import 'package:filkom_eats/screens/change_password_page.dart';
import 'package:flutter/material.dart';
import 'user_model.dart';
import 'user_service.dart';
import 'edit_profile_page.dart';
import 'help_center_page.dart';
import 'purchase_history_page.dart';
import '../screens/auth/login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Color primaryPink = const Color(0xFFFF5C8A);

  UserModel? user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    user = await UserService.getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryPink,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // ===== HEADER =====
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    color: primaryPink,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 50, color: Colors.grey),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        user!.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user!.email,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // ===== MENU =====
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _menuItem(
                        icon: Icons.edit,
                        title: "Edit Profile",
                        onTap: () async {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (_) => _profilePhotoSheet(context),
                          );
                        },
                      ),
                      _menuItem(
                        icon: Icons.history,
                        title: "Purchase History",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PurchaseHistoryPage(),
                            ),
                          );
                        },
                      ),
                      _menuItem(
                        icon: Icons.lock,
                        title: "Change Password",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ChangePasswordPage(),
                            ),
                          );
                        },
                      ),
                      _menuItem(
                        icon: Icons.help_outline,
                        title: "Help Center",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HelpCenterPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      // ===== SIGN OUT =====
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryPink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            await UserService.logout();

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            "Sign Out",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  // ================== WIDGET BANTUAN ==================

  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFFE4EC),
          child: Icon(icon, color: primaryPink),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  Widget _profilePhotoSheet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              const Text(
                "Profile Photo",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(),
          _sheetItem(Icons.camera_alt, "Camera"),
          _sheetItem(Icons.image, "Gallery"),
          _sheetItem(Icons.delete, "Delete Photo", isDelete: true),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryPink,
              minimumSize: const Size(double.infinity, 45),
            ),
            onPressed: () async {
              Navigator.pop(context);
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EditProfilePage()),
              );
              if (result == true) {
                _loadUser(); // 🔁 AUTO REFRESH
              }
            },
            child: const Text("Edit Profile"),
          ),
        ],
      ),
    );
  }

  Widget _sheetItem(IconData icon, String text, {bool isDelete = false}) {
    return ListTile(
      leading: Icon(icon, color: isDelete ? Colors.red : Colors.pink),
      title: Text(
        text,
        style: TextStyle(color: isDelete ? Colors.red : Colors.black),
      ),
    );
  }
}
