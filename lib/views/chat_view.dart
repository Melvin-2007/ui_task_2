import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_6/config/app_assets.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/models/message_model.dart';
import 'package:task_6/models/user_model.dart';
import 'package:task_6/widgets/app_bottom_nav_bar.dart';
import 'package:task_6/widgets/app_search_bar.dart';
import 'package:task_6/widgets/app_text_field.dart';
import 'package:task_6/widgets/custom_app_bar.dart';
import 'package:task_6/widgets/chat_tile.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  static List<UserModel> users = [
    UserModel(
      name: 'Aarav',
      unreadCount: 4,
      messages: [
        MessageModel(isReceived: true, message: ['Hey, are you free right now?', 'I wanted to talk about yesterday.']),
        MessageModel(
          isReceived: false,
          message: [
            'Yeah, I’m free.',
            'Yesterday was a bit chaotic honestly 😅',
            'I didn’t expect things to go that way, but I think we handled it better than we usually do.',
          ],
        ),
        MessageModel(
          isReceived: true,
          message: [
            'True.',
            'I was stressed at first, but later it felt fine.',
            'Let’s talk properly when we meet today.',
          ],
        ),
      ],
    ),

    UserModel(
      name: 'Ananya',
      unreadCount: 1,
      messages: [
        MessageModel(isReceived: true, message: ['Did you submit the report?']),
        MessageModel(
          isReceived: false,
          message: [
            'Not yet.',
            'I reviewed it once more and found a few things that needed clarification.',
            'I’ll submit it tonight after cleaning those up properly.',
          ],
        ),
      ],
    ),

    UserModel(
      name: 'Rohit',
      unreadCount: 0,
      messages: [
        MessageModel(isReceived: false, message: ['Just reached home.', 'The traffic was worse than usual today.']),
        MessageModel(
          isReceived: true,
          message: ['Yeah, I noticed that too.', 'Probably because of the road work near the junction.'],
        ),
      ],
    ),

    UserModel(
      name: 'Meera',
      unreadCount: 2,
      messages: [
        MessageModel(isReceived: true, message: ['Can you review my design once?']),
        MessageModel(
          isReceived: false,
          message: [
            'Sure.',
            'I’ll take a detailed look and share feedback.',
            'Might take a little time because I want to go through each screen carefully.',
          ],
        ),
      ],
    ),

    UserModel(
      name: 'Karthik',
      unreadCount: 0,
      messages: [
        MessageModel(isReceived: true, message: ['Movie tonight?']),
        MessageModel(isReceived: false, message: ['I’m in.', 'Let’s decide the timing after dinner.']),
      ],
    ),

    UserModel(
      name: 'Sneha',
      unreadCount: 3,
      messages: [
        MessageModel(
          isReceived: true,
          message: ['I think the API response has changed.', 'Some fields are missing now.'],
        ),
        MessageModel(
          isReceived: false,
          message: [
            'That explains the crash.',
            'I’ll update the parsing logic and add proper null checks.',
            'We should also log this so we can catch similar issues earlier next time.',
          ],
        ),
      ],
    ),

    UserModel(
      name: 'Vishal',
      unreadCount: 0,
      messages: [
        MessageModel(
          isReceived: false,
          message: ['Thanks for helping yesterday.', 'Couldn’t have wrapped it up without you.'],
        ),
        MessageModel(isReceived: true, message: ['No worries.', 'Happy to help anytime.']),
      ],
    ),

    UserModel(
      name: 'Neha',
      unreadCount: 1,
      messages: [
        MessageModel(isReceived: true, message: ['Are we still meeting tomorrow?']),
        MessageModel(
          isReceived: false,
          message: [
            'Yes.',
            'Tomorrow works fine for me.',
            'Let’s keep it flexible in case something comes up last minute.',
          ],
        ),
      ],
    ),

    UserModel(
      name: 'Arjun',
      unreadCount: 0,
      messages: [
        MessageModel(isReceived: false, message: ['I pushed the latest changes.', 'Please pull and test once.']),
        MessageModel(isReceived: true, message: ['Got it.', 'I’ll test it after lunch.']),
      ],
    ),

    UserModel(
      name: 'Pooja',
      unreadCount: 2,
      messages: [
        MessageModel(isReceived: true, message: ['I’m a bit confused about the requirements.']),
        MessageModel(
          isReceived: false,
          message: [
            'That’s understandable.',
            'The requirements weren’t very clear initially.',
            'I’ll explain everything step by step when we talk, it should make more sense then.',
          ],
        ),
      ],
    ),

    UserModel(
      name: 'Aditya',
      unreadCount: 0,
      messages: [
        MessageModel(isReceived: false, message: ['Morning.', 'Hope today goes smoothly.']),
        MessageModel(isReceived: true, message: ['Morning.', 'Yeah, fingers crossed.']),
      ],
    ),

    UserModel(
      name: 'Ishita',
      unreadCount: 1,
      messages: [
        MessageModel(isReceived: true, message: ['Did you read my last message?']),
        MessageModel(
          isReceived: false,
          message: [
            'Yes, I did.',
            'I needed some time to think before replying properly.',
            'I’ll share my thoughts in detail later today.',
          ],
        ),
      ],
    ),

    UserModel(
      name: 'Manoj',
      unreadCount: 0,
      messages: [
        MessageModel(isReceived: true, message: ['All good from your side?']),
        MessageModel(isReceived: false, message: ['Yes.', 'Everything is stable for now.']),
      ],
    ),

    UserModel(
      name: 'Riya',
      unreadCount: 2,
      messages: [
        MessageModel(isReceived: true, message: ['I was thinking about what you said yesterday.']),
        MessageModel(
          isReceived: false,
          message: [
            'Same here.',
            'It stayed on my mind longer than I expected.',
            'Let’s talk about it calmly and figure out what actually makes sense for both of us.',
          ],
        ),
      ],
    ),

    UserModel(
      name: 'Suresh',
      unreadCount: 0,
      messages: [
        MessageModel(
          isReceived: false,
          message: ['Call me when you’re free.', 'Nothing urgent, just wanted to discuss something.'],
        ),
        MessageModel(isReceived: true, message: ['Sure.', 'I’ll call you in the evening.']),
      ],
    ),
  ];

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: AppBottomNavBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 54),
                AppSearchBar(),
                SizedBox(height: 24),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ChatTile(userModel: ChatView.users[index], onMessageSend: () => setState(() {})),
                  separatorBuilder: (context, _) => SizedBox(height: 24),
                  itemCount: ChatView.users.length,
                ),
              ],
            ),
          ),
          CustomAppBar(
            title: "Chats",
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),

            leftIcon: GestureDetector(
              onTap: () {
                log("Edit text tapped");
              },
              child: Text(
                "Edit",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.blue),
              ),
            ),
            rightIcon: GestureDetector(
              onTap: () {
                log("Edit Button tapped");
              },
              child: SvgPicture.asset(
                AppAssets.edit,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
