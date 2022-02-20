import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surf_practice_chat_flutter/domain/chat/providers.dart';

import '../../../utils/Strings.dart';
import '../../domain/user/providers.dart';

class NameAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const NameAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userManager = ref.watch(userManagerProvider);
    final chatManager = ref.watch(chatManagerProvider);

    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: userManager.updateNickname,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: Strings.nameHint,
                hintStyle: TextStyle(
                  color: Colors.white38,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: chatManager.updateMessages,
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
