import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'gif_box': Icons.gif_box,
  'assistant_direction': Icons.assistant_direction,
  'swap_horiz': Icons.swap_horiz,
  'gswitch_access_shortcut': Icons.switch_access_shortcut,
  'link': Icons.link,
  'exit_to_app': Icons.exit_to_app,
  'send': Icons.send,
  'cloud_download': Icons.cloud_download,
  'cloud_done': Icons.cloud_done,
  'cloud_upload': Icons.cloud_upload,
  'upgrade': Icons.upgrade,
  'delete': Icons.delete,
  'communication': Icons.http,
  'data_object': Icons.  data_object,
  'database': Icons.save,
  'note_add': Icons.note_add,
  'save': Icons.save_as,
};

Icon getIcon(String iconName) {
  return Icon(
    _icons[iconName],
    color: Colors.cyan,
  );
}