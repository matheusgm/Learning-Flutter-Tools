import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final Widget? leading;
  final String? title;
  final Widget? trailing1;
  final Widget? trailing2;
  final void Function()? onTapTile;
  final void Function()? onTap1;
  final void Function()? onTap2;

  const MyListTile(
      {this.leading, this.title, this.trailing1, this.trailing2, this.onTapTile, this.onTap1, this.onTap2, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapTile,
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.transparent,
        child: Row(
          children: [
            leading != null
                ? Padding(
                    padding: const EdgeInsets.all(6),
                    child: IconTheme(
                      data: const IconThemeData(color: Colors.grey),
                      child: leading!,
                    ),
                  )
                : Container(),
            Expanded(
              child: Container(
                // color: Colors.amber,
                margin: const EdgeInsets.only(left: 25, right: 5),
                child: Text(
                  title ?? "",
                  style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
            ),
            trailing1 != null
                ? IconButton(
                    padding: const EdgeInsets.all(6),
                    icon: trailing1!,
                    splashRadius: 20,
                    constraints: const BoxConstraints(),
                    onPressed: onTap1,
                    color: Colors.grey,
                  )
                : Container(),
            trailing2 != null
                ? IconButton(
                    padding: const EdgeInsets.all(6),
                    constraints: const BoxConstraints(),
                    icon: trailing2!,
                    splashRadius: 20,
                    onPressed: onTap2,
                    color: Colors.grey,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
