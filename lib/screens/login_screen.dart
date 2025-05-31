import 'package:flutter/material.dart';
import '../widgets/role_selector.dart';
import '../widgets/student_form.dart';
import '../widgets/teacher_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserRole _selectedRole = UserRole.student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Logo and Tagline
                Image.asset(
                  'assets/logo.png',
                  height: 80,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.school,
                      size: 80,
                      color: Color(0xFF3498DB),
                    );
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Learn. Compete. Earn.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3498DB),
                  ),
                ),
                const SizedBox(height: 40),
                // Role Selector
                RoleSelector(
                  selectedRole: _selectedRole,
                  onRoleChanged: (role) {
                    setState(() {
                      _selectedRole = role;
                    });
                  },
                ),
                const SizedBox(height: 32),
                // Dynamic Form Content
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _selectedRole == UserRole.student
                      ? const StudentForm()
                      : const TeacherForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum UserRole { student, teacher } 