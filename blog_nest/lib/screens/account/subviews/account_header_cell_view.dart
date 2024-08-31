import 'package:blog_nest/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import '../../../extensions/color_ext.dart';
import '../../../model/user.dart';
import '../../../utils/img_converter.dart';
import '../../../utils/typedefs.dart';

class AccountHeaderCellView extends StatelessWidget {
  const AccountHeaderCellView({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: AspectRatio(
        aspectRatio: 5,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BR.circular(8),
                  child: ImgConverter.imageFromBase64String(
                      user?.avatarData ?? ''),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MAL.center,
                crossAxisAlignment: CAL.start,
                children: [
                  Text(user?.name ?? 'Name')
                      .styled(size: 14, weight: FW.w500, color: C.text2),
                  const SizedBox(height: 4),
                  Text(user?.jobTitle ?? '')
                      .styled(size: 10, weight: FW.w500, color: C.text2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
