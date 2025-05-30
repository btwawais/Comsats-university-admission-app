import 'package:cui_admission/authentication/signin.dart';
import 'package:cui_admission/statemanagement/auth_prov.dart';
import 'package:cui_admission/utils/app_colors.dart';
import 'package:cui_admission/utils/color.dart';
import 'package:cui_admission/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final MyFlutterToast _toast = MyFlutterToast();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<EmailAuthProv>(context);
    final User? user = authProvider.auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Appcolors().forth,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => _logout(context, authProvider),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColor.primary.withOpacity(0.2),
                    child: Icon(
                      Icons.person,
                      size: 25,
                      color: AppColor.primary,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   Text(
                      //     user?.displayName ?? 'No Name',
                      //     style: const TextStyle(
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // const SizedBox(height: 5),
                      Text(
                        user?.email ?? 'No Email',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Account Information
            _buildSectionHeader('Account Information'),
            _buildInfoCard(
              Icons.email,
              'Email',
              user?.email ?? 'Not available',
            ),
            _buildInfoCard(
              Icons.person,
              'Name',
              authProvider.signupname.text ?? "notset",
            ),
            _buildInfoCard(
              Icons.verified_user,
              'Email Verified',
              user?.emailVerified ?? false ? 'Verified' : 'Not Verified',
              isVerified: user?.emailVerified ?? false,
            ),
            const SizedBox(height: 30),

            // Account Actions
            _buildSectionHeader('Account Actions'),
            _buildActionTile(
              Icons.lock_reset,
              'Change Password',
              onTap: () => _changePassword(context, authProvider),
            ),
            _buildActionTile(
              Icons.delete,
              'Delete Account',
              color: Colors.red,
              onTap: () => _showDeleteAccountDialog(context, authProvider),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    IconData icon,
    String title,
    String value, {
    bool isVerified = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(icon, color: isVerified ? Colors.green : AppColor.primary),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            if (isVerified) Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(
    IconData icon,
    String title, {
    Color? color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: color ?? AppColor.primary),
        title: Text(
          title,
          style: TextStyle(
            color: color ?? Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  Future<void> _logout(BuildContext context, EmailAuthProv authProvider) async {
    try {
      await authProvider.auth.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Signin()),
        (route) => false,
      );
      _toast.toastmessage('Logged out successfully');
    } catch (e) {
      _toast.toastmessage('Error logging out: ${e.toString()}');
    }
  }

  Future<void> _changePassword(
    BuildContext context,
    EmailAuthProv authProvider,
  ) async {
    final currentUser = authProvider.auth.currentUser;
    if (currentUser == null) return;

    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Change Password'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'New Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm New Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (newPasswordController.text !=
                      confirmPasswordController.text) {
                    _toast.toastmessage('Passwords do not match');
                    return;
                  }

                  try {
                    await currentUser.updatePassword(
                      newPasswordController.text,
                    );
                    Navigator.pop(context);
                    _toast.toastmessage('Password updated successfully');
                  } catch (e) {
                    _toast.toastmessage(
                      'Error updating password: ${e.toString()}',
                    );
                  }
                },
                child: const Text('Update'),
              ),
            ],
          ),
    );
  }

  Future<void> _showDeleteAccountDialog(
    BuildContext context,
    EmailAuthProv authProvider,
  ) async {
    final currentUser = authProvider.auth.currentUser;
    if (currentUser == null) return;

    await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete Account'),
            content: const Text(
              'Are you sure you want to delete your account? This action cannot be undone.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () async {
                  try {
                    await currentUser.delete();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Signin()),
                      (route) => false,
                    );
                    _toast.toastmessage('Account deleted successfully');
                  } catch (e) {
                    _toast.toastmessage(
                      'Error deleting account: ${e.toString()}',
                    );
                  }
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }
}
