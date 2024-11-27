import 'package:flutter/material.dart';

class CustomRoleWidget extends StatelessWidget {
  final String currentRole;
  final Widget adminWidget;
  final Widget userWidget;
  final Widget managerWidget;

  const CustomRoleWidget({
    super.key,
    required this.currentRole,
    required this.adminWidget,
    required this.userWidget,
    required this.managerWidget,
  });

  @override
  Widget build(BuildContext context) {
    return _buildRoleWidget();
  }

  Widget _buildRoleWidget() {
    switch (currentRole) {
      case 'ADM':
        return adminWidget;
      case 'USR':
        return userWidget;
      case 'HED':
        return managerWidget;
      default:
        return const SizedBox();
    }
  }
}
