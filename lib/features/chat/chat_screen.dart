import 'package:chatify/core/models/message_model.dart';
import 'package:chatify/core/routes/routes.dart';
import 'package:chatify/core/utils/assets.dart';
import 'package:chatify/core/utils/colors.dart';
import 'package:chatify/core/utils/strings.dart';
import 'package:chatify/core/widgets/custom_text_form_field.dart';
import 'package:chatify/core/widgets/indecator.dart';
import 'package:chatify/core/widgets/navigate.dart';
import 'package:chatify/features/auth/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:chatify/core/widgets/custom_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController messageController = TextEditingController();
final ScrollController controller = ScrollController();

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String email =
        BlocProvider.of<AuthCubit>(context).emailController2.text;
    final ScrollController controller = ScrollController();
    CollectionReference messages =
        FirebaseFirestore.instance.collection(AppStrings.messages);

    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('CreatedAt', descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(MessageModel.fromjson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 50,
                backgroundColor: AppColors.primary,
                title: Text(AppStrings.Chatify),
                centerTitle: true,
              ),
              drawer: Drawer(
                  child: Column(
                children: [
                  DrawerHeader(
                      child: CircleAvatar(
                    radius: 100,
                    backgroundColor: AppColors.primary,
                    child: Text(
                      email,
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  )),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_back,
                      color: AppColors.primary,
                      size: 32,
                    ),
                    title: Text(
                      'Sign Out',
                      style: TextStyle(color: AppColors.primary, fontSize: 24),
                    ),
                    onTap: () {
                      // Handle item tap
                      context.navigateTo(Routes.initialRoute);
                    },
                  ),
                ],
              )),
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        AppAssets.backgroundh), // Replace with your image path
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          reverse: true,
                          controller: controller,
                          itemCount: messageList.length,
                          itemBuilder: (context, index) => CustomChatBubble(
                            type: messageList[index].id == email
                                ? BubbleType.sendBubble
                                : BubbleType.receiverBubble,
                            model: messageList[index],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                onSubmit: (data) {
                                  messages.add({
                                    AppStrings.message: data,
                                    'CreatedAt': DateTime.now(),
                                    'id': email
                                  });
                                  messageController.clear();
                                  controller.animateTo(0,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                },
                                controller: messageController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppStrings.empty;
                                  }
                                  return null;
                                },
                                radius: 16,
                                hintText: 'Type message...',
                                suffix1: Icons.attach_file,
                                suffix2: Icons.camera_alt,
                                prefix: Icons.emoji_emotions_outlined,
                                suffixOnPressed1: () {},
                                suffixOnPressed2: () {},
                                prefixOnPressed: () {},
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print(email);
                                print(
                                    "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                                messages.add({
                                  AppStrings.message: messageController.text,
                                  'CreatedAt': DateTime.now(),
                                  'id': email
                                });
                                messageController.clear();
                                controller.animateTo(0,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                                print(AuthCubit().emailController2.text);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 8),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Icon(
                                  Icons.send,
                                  color: AppColors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                body: Center(
                    child: CustomLoadingIndicator(
              h: 32,
              w: 36,
            )));
          } else {
            return Center(child: Text('Try again later'));
          }
        });
  }
}
