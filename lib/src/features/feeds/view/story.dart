class Story {
  final String image;
  final String name;
  Story(this.image, this.name);
}

class Post {
  final String userImage;
  final String username;
  final String postImage;
  final String caption;

  Post({
    required this.userImage,
    required this.username,
    required this.postImage,
    required this.caption,
  });
}
