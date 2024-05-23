import 'package:flutter/material.dart';

class ListOfOption extends StatelessWidget {
  final Icon icon;
  final String title;
  final VoidCallback onTap;

  const ListOfOption({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
      onTap: onTap,
    );
  }
}
