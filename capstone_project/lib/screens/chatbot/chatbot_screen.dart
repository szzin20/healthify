import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/chatbot_provider/chatbot_provider.dart';
import 'package:capstone_project/screens/chatbot/widgets/question_button.dart';

import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor().backgroundChat,
      body: Consumer<ChatBotProvider>(
        builder: (context, chatbotProvider, child) {
          final listMessage = chatbotProvider.listMessage;

          return Stack(children: [
            ChatView(
              currentUser: chatbotProvider.currentUser(
                activeUserId: '1',
                activeUserName: 'user',
              ),
              chatController: chatbotProvider.setChatController(
                initialMessageList: listMessage,
                scrollController: ScrollController(),
                chatUsers: [
                  ChatUser(
                      id: '0',
                      name: 'CareBot',
                      profilePhoto:
                          'https://cdn1.iconfinder.com/data/icons/bots/280/bot-10-2-512.png'),
                ],
              ),
              onSendTap: chatbotProvider.onSendTap,
              featureActiveConfig: const FeatureActiveConfig(
                lastSeenAgoBuilderVisibility: true,
                receiptsBuilderVisibility: true,
                enableDoubleTapToLike: false,
                enableReactionPopup: false,
                enableChatSeparator: false,
              ),
              chatViewState: ChatViewState.hasMessages,
              chatViewStateConfig: ChatViewStateConfiguration(
                loadingWidgetConfig: ChatViewStateWidgetConfiguration(
                  widget: Center(
                    child: CircularProgressIndicator(
                      color: ThemeColor().primaryFrame,
                    ),
                  ),
                ),
              ),
              appBar: ChatViewAppBar(
                profilePicture:
                    'https://cdn1.iconfinder.com/data/icons/bots/280/bot-10-2-512.png',
                elevation: 3,
                backGroundColor: ThemeColor().primaryFrame,
                backArrowColor: ThemeColor().white,
                chatTitle: "CareBot",
                chatTitleTextStyle: ThemeTextStyle()
                    .titleMedium
                    .copyWith(color: ThemeColor().white),
              ),
              chatBackgroundConfig: ChatBackgroundConfiguration(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .071),
                messageTimeIconColor: ThemeColor().black,
                messageTimeTextStyle: TextStyle(color: ThemeColor().black),
                backgroundColor: ThemeColor().backgroundChat,
              ),
              typeIndicatorConfig: TypeIndicatorConfiguration(
                flashingCircleBrightColor: Colors.grey,
                flashingCircleDarkColor: ThemeColor().primaryFrame,
              ),
              sendMessageConfig: SendMessageConfiguration(
                sendButtonIcon: SvgPicture.asset('assets/icons/send_icon.svg'),
                enableCameraImagePicker: false,
                enableGalleryImagePicker: false,
                allowRecordingVoice: false,
                replyMessageColor: ThemeColor().white,
                replyDialogColor: ThemeColor().primaryFrame,
                replyTitleColor: const Color.fromARGB(255, 140, 231, 217),
                textFieldBackgroundColor: ThemeColor().white,
                closeIconColor: ThemeColor().white,
                textFieldConfig: TextFieldConfiguration(
                  hintText: 'Masukkan pesan',
                  hintStyle: ThemeTextStyle()
                      .bodyMedium
                      .copyWith(color: ThemeColor().placeholderChatBot),
                  textStyle: ThemeTextStyle()
                      .bodyLarge
                      .copyWith(color: ThemeColor().textChatBot),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                  onMessageTyping: (status) {
                    debugPrint(status.toString());
                  },
                  compositionThresholdTime: const Duration(seconds: 1),
                ),
              ),
              chatBubbleConfig: ChatBubbleConfiguration(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                outgoingChatBubbleConfig: ChatBubble(
                  color: ThemeColor().backgroundOutgoingBubbleChat,
                  textStyle: ThemeTextStyle().textOutgoingBubbleChat,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  linkPreviewConfig: LinkPreviewConfiguration(
                      linkStyle: TextStyle(color: ThemeColor().linkColor),
                      backgroundColor: ThemeColor().linkPreviewOutgoing,
                      bodyStyle: ThemeTextStyle()
                          .textOutgoingBubbleChat
                          .copyWith(color: ThemeColor().black),
                      titleStyle: ThemeTextStyle()
                          .textOutgoingBubbleChat
                          .copyWith(
                              color: ThemeColor().black,
                              fontWeight: FontWeight.bold)),
                  receiptsWidgetConfig: const ReceiptsWidgetConfig(
                    showReceiptsIn: ShowReceiptsIn.all,
                  ),
                ),
                inComingChatBubbleConfig: ChatBubble(
                  color: ThemeColor().backgroundIncomingBubbleChat,
                  textStyle: ThemeTextStyle().textIncomingBubbleChat,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  linkPreviewConfig: LinkPreviewConfiguration(
                      linkStyle: TextStyle(
                        color: ThemeColor().linkColor,
                      ),
                      backgroundColor: ThemeColor().linkPreviewIncoming,
                      bodyStyle: ThemeTextStyle()
                          .textIncomingBubbleChat
                          .copyWith(color: ThemeColor().white),
                      titleStyle: ThemeTextStyle()
                          .textIncomingBubbleChat
                          .copyWith(
                              color: ThemeColor().white,
                              fontWeight: FontWeight.bold)),
                  onMessageRead: (message) {
                    debugPrint('Message Read');
                  },
                  senderNameTextStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              replyPopupConfig: ReplyPopupConfiguration(
                backgroundColor: ThemeColor().white,
                buttonTextStyle: TextStyle(color: ThemeColor().primaryFrame),
                topBorderColor: ThemeColor().white,
              ),
              messageConfig: MessageConfiguration(
                imageMessageConfig: ImageMessageConfiguration(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  shareIconConfig: ShareIconConfiguration(
                    defaultIconBackgroundColor: ThemeColor().white,
                    defaultIconColor: ThemeColor().black,
                  ),
                ),
              ),
              profileCircleConfig: const ProfileCircleConfiguration(
                profileImageUrl:
                    'https://cdn1.iconfinder.com/data/icons/bots/280/bot-10-2-512.png',
                padding: EdgeInsets.only(left: 0),
              ),
              repliedMessageConfig: RepliedMessageConfiguration(
                backgroundColor: const Color.fromARGB(255, 20, 184, 160),
                verticalBarColor: ThemeColor().primaryFrame,
                repliedMsgAutoScrollConfig: const RepliedMsgAutoScrollConfig(
                  enableHighlightRepliedMsg: true,
                  highlightColor: Color.fromARGB(255, 59, 247, 218),
                  highlightScale: 1.1,
                ),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.25,
                ),
                replyTitleTextStyle: TextStyle(color: ThemeColor().black),
              ),
              swipeToReplyConfig: SwipeToReplyConfiguration(
                replyIconColor: ThemeColor().black,
              ),
            ),
            Align(
              alignment: const Alignment(-1, 1),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 22, right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    QuestionButton(
                      text: 'Cara Pembayaran Obat',
                      onPressed: () {
                        chatbotProvider
                            .onQuestionPressed('Cara Pembayaran Obat');
                      },
                    ),
                    QuestionButton(
                      text: 'Beri Rating Dokter',
                      onPressed: () {
                        chatbotProvider.onQuestionPressed('Beri Rating Dokter');
                      },
                    ),
                    QuestionButton(
                      text: 'Lihat Riwayat Konsultasi',
                      onPressed: () {
                        chatbotProvider
                            .onQuestionPressed('Lihat Riwayat Konsultasi');
                      },
                    ),
                  ],
                ),
              ),
            )
          ]);
        },
      ),
    );
  }
}
