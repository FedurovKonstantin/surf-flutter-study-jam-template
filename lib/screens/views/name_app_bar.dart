import 'package:flutter/material.dart';

import '../../utils/Strings.dart';

class NameAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NameAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Expanded(
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  hintText: Strings.nameHint,
                  hintStyle: TextStyle(
                    color: Colors.white38,
                  )),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
