import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'check_box_outline': Icons.check_box_outline_blank,
  'text_fields': Icons.text_fields,
  'slider': Icons.tune,
  'list': Icons.list
};

Icon getIcon(String iconName) {
  return Icon(_icons[iconName], color: Colors.blue);
}
