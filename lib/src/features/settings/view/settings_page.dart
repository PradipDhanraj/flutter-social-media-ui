import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_ui/src/common/app_theme_config.dart';
import 'package:flutter_social_media_ui/src/features/feeds/widgets/cache_image_widget.dart';
import 'package:flutter_social_media_ui/src/features/settings/bloc/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ListTile tileWidget({
    required String title,
    required String subtitle,
    required IconData icon,
    required void Function()? onTap,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(icon, size: AppFontSizes.iconSmallSize),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CacheImage(
                    imageUrl: "test",
                    height: 100,
                    width: 100,
                    imageId: "profile_pic",
                    cacheDurationDays: 10,
                    placeholder: Icon(
                      CupertinoIcons.person_alt_circle_fill,
                      color: AppColors.imageColor,
                      size: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pradip Dhanraj',
                          style: TextStyle(
                            fontSize: AppFontSizes.textLargeSize,
                          ),
                        ),
                        Text(
                          'Pradip Dhanraj',
                          style: TextStyle(
                            fontSize: AppFontSizes.textSmallSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              tileWidget(
                title: 'Wishlist',
                subtitle: 'Wished content from library',
                icon: CupertinoIcons.bookmark_fill,
                onTap: () {},
              ),
              tileWidget(
                title: 'Liked Content',
                subtitle: 'Liked content from library',
                icon: CupertinoIcons.heart_circle_fill,
                onTap: () {},
              ),
              const Spacer(),
              const SafeArea(
                child: Align(
                  child: Text(
                    'Made in Flutter',
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
