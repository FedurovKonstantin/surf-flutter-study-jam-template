import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/Strings.dart';
import '../../domain/user/providers.dart';
import '../../domain/user/user_manager.dart';

class NameAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const NameAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController nameTextController;

    nameTextController = useTextEditingController();

    final userManager = ref.watch(userManagerProvider);

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
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              userManager.setNickname(nameTextController.text);
            },
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
