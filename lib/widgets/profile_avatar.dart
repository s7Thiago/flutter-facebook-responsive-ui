import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({
    Key key,
    @required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17.0 : 20.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        isActive
            ? Positioned(
                right: 0.0,
                bottom: 7.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Palette.online,
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
