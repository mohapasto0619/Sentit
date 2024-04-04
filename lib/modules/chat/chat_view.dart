import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sentit/core/utils/screen_size.dart';
import 'package:sentit/core/widgets/chat_app_bar.dart';
import 'package:sentit/core/widgets/error_text_message.dart';
import 'package:sentit/modules/chat/chat_notifier.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_icon_sizes.dart';
import 'package:sentit/theme/app_padding.dart';
import 'package:sentit/theme/app_radius.dart';
import 'package:sentit/theme/app_text_styles.dart';

class ChatView extends ConsumerStatefulWidget {
  const ChatView({
    Key? key,
    required this.userId,
    required this.receiverId,
    required this.receiverUsername,
  }) : super(key: key);

  final String userId;
  final String receiverId;
  final String receiverUsername;

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  late TextEditingController sendController;
  @override
  void initState() {
    super.initState();
    sendController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final inputMessage = ref.watch(inputMessageProvider);
    final paddings = ref.watch(paddingThemeProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(
                size.width * paddings.sm,
              ),
              child: ChatAppBar(
                title: widget.receiverUsername,
                onPressed: () {
                  context.pop();
                },
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: MessageListView(
                      userId: widget.userId,
                      receiverId: widget.receiverId,
                      receiverUsername: widget.receiverUsername,
                    ),
                  ),
                  MessageInputView(
                    controller: sendController,
                    hintText: 'Enter message...',
                    onChanged: (value) {
                      ref
                          .read(inputMessageProvider.notifier)
                          .setInputmessage(value);
                    },
                    onSend: () {
                      ref
                          .read(messagesProvider(
                            widget.userId,
                            widget.receiverId,
                            widget.receiverUsername,
                          ).notifier)
                          .sendMessage(widget.receiverId, inputMessage);
                      sendController.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageListView extends ConsumerWidget {
  const MessageListView({
    super.key,
    required this.userId,
    required this.receiverId,
    required this.receiverUsername,
  });
  final String userId;
  final String receiverId;
  final String receiverUsername;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messagesProvider(
      userId,
      receiverId,
      receiverUsername,
    ));
    return messages.when(
      data: (data) {
        return ListView.builder(
          itemCount: data.docs.length,
          itemBuilder: (context, index) {
            return MessageView(
              message: data.docs[index],
              userId: userId,
            );
          },
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: ErrorTextMessage(message: "Error can't load messages"),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class MessageView extends ConsumerWidget {
  const MessageView({
    super.key,
    required this.userId,
    required this.message,
  });

  final DocumentSnapshot message;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(appColorThemeProvider);
    final textStyles = ref.watch(textThemeProvider);
    final paddings = ref.watch(paddingThemeProvider);
    final radius = ref.watch(radiusThemeProvider);
    final size = MediaQuery.of(context).size;
    final screenCategory = getScreenSize(context);
    return Padding(
      padding: EdgeInsets.all(
        size.width * paddings.xs,
      ),
      child: Row(
        mainAxisAlignment: (message['senderId'] == userId)
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: (message['senderId'] == userId)
                  ? EdgeInsets.only(left: size.width * paddings.xl)
                  : EdgeInsets.only(right: size.width * paddings.xl),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius.base)),
                ),
                color: (message['senderId'] == userId)
                    ? colors.tertiary
                    : colors.primary,
                child: Padding(
                  padding: EdgeInsets.all(
                    screenCategory.size >= ScreenSize.large.size
                        ? size.width * paddings.sm
                        : size.width * paddings.base,
                  ),
                  child: Text(
                    message['message'],
                    style: textStyles.bodyThick.withColor(
                      colors.onPrimary,
                      context,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MessageInputView extends ConsumerWidget {
  const MessageInputView({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.onSend,
  });

  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onChanged;
  final VoidCallback? onSend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radius = ref.watch(radiusThemeProvider);
    final paddings = ref.watch(paddingThemeProvider);
    final textStyles = ref.watch(textThemeProvider);
    final iconSizes = ref.watch(appIconSizesProvider);
    final colors = ref.watch(appColorThemeProvider);
    final size = MediaQuery.of(context).size;
    final screenCategory = getScreenSize(context);
    return Padding(
      padding: EdgeInsets.all(size.width * paddings.sm),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: textStyles.body.withColor(
                colors.primary,
                context,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenCategory.size >= ScreenSize.large.size
                      ? size.width * paddings.sm
                      : size.width * paddings.base,
                  horizontal: screenCategory.size >= ScreenSize.large.size
                      ? size.width * paddings.sm
                      : size.width * paddings.base,
                ),
                hintText: hintText,
                hintStyle: textStyles.bodyBase.withColor(
                  colors.colorGrey400,
                  context,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: colors.colorGrey300,
                  ),
                  borderRadius: BorderRadius.circular(
                    radius.base,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: colors.primary,
                  ),
                  borderRadius: BorderRadius.circular(
                    radius.base,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: onSend,
            icon: Icon(
              Icons.send,
              color: colors.primary,
              size: screenCategory.size >= ScreenSize.large.size
                  ? size.width * iconSizes.mini
                  : size.width * iconSizes.small,
            ),
          )
        ],
      ),
    );
  }
}
