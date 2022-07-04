import 'package:flutter/material.dart';
import 'my_list_tile_widget.dart';

class PersonalListTile extends StatelessWidget {
  final String? title;
  final void Function()? tileTap;
  final void Function()? onDelete;

  const PersonalListTile({
    Key? key,
    this.tileTap,
    this.onDelete,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      leading: const Icon(Icons.person),
      title: title,
      trailing2: const Icon(Icons.delete),
      onTap2: onDelete,
      onTapTile: tileTap,
    );
  }
}
