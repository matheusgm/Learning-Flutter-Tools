import 'package:flutter/material.dart';
import 'my_list_tile_widget.dart';

class GroupListTile extends StatelessWidget {
  final String? title;
  final bool clientIsAdmin;
  final void Function()? tileTap;
  final void Function()? onEdit;
  final void Function()? onDelete;

  const GroupListTile({
    Key? key,
    this.clientIsAdmin = false,
    this.tileTap,
    this.onEdit,
    this.onDelete,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      leading: const Icon(Icons.group),
      title: title,
      trailing1: clientIsAdmin ? const Icon(Icons.edit) : null,
      trailing2: const Icon(Icons.delete),
      onTap1: onEdit,
      onTap2: onDelete,
      onTapTile: tileTap,
    );
  }
}
