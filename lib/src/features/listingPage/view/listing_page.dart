import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_ui/src/common/app_theme_config.dart';
import 'package:flutter_social_media_ui/src/common/utils.dart';
import 'package:flutter_social_media_ui/src/features/feeds/bloc/feeds_bloc.dart';
import 'package:flutter_social_media_ui/src/features/feeds/widgets/cache_image_widget.dart';
import 'package:flutter_social_media_ui/src/features/listingPage/bloc/listing_bloc.dart';

class ListingPage extends StatefulWidget {
  static const routeName = "listingpage";
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ListingBloc, ListingState>(
          builder: (context, state) {
            return Text((state as ListingInitialState).title);
          },
        ),
      ),
      body: BlocConsumer<ListingBloc, ListingState>(
        listener: (context, state) {
          context.read<FeedsBloc>().add(RefreshFeedsEvent());
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: (state as ListingInitialState).data.length,
            itemBuilder: (context, index) {
              var feed = (state).data[index];
              return ListTile(
                key: ValueKey("${feed.isLiked}-${feed.isWished}"),
                title: Text(
                  feed.title ?? "Title",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(feed.username ?? "Subtitle"),
                leading: CacheImage(
                  imageUrl: feed.url,
                  height: 40,
                  width: 40,
                  imageId: "profile_pic",
                  cacheDurationDays: 10,
                  placeholder: Icon(
                    CupertinoIcons.person_alt_circle_fill,
                    color: AppColors.imageColor,
                    size: 40,
                  ),
                ),
                trailing: InkWell(
                  onTap: () {
                    switch ((state).type) {
                      case CategoryType.isLiked:
                        context.read<ListingBloc>().add(
                              UpdateDBEvent(
                                feed.id,
                                isLiked: false,
                                isWished: feed.isWished!,
                              ),
                            );
                        break;
                      case CategoryType.isWished:
                        context.read<ListingBloc>().add(
                              UpdateDBEvent(
                                feed.id,
                                isLiked: feed.isLiked!,
                                isWished: false,
                              ),
                            );
                        break;
                      default:
                    }
                  },
                  child: Icon(
                    CupertinoIcons.delete_solid,
                    size: AppFontSizes.iconSmallSize * .8,
                    color: Colors.white,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
