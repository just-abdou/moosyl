// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moosyl/l10n/generated/software_pay_localization.dart';

import 'package:moosyl/src/widgets/icons.dart';

class Feedbacks {
  static void flushBar({
    required String message,
    required BuildContext context,
    bool error = true,
  }) {
    double margin;

    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      margin = 24;
    } else {
      margin = (width - 600) / 2;
    }

    SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0.0,
      margin: EdgeInsets.symmetric(
        horizontal: margin,
      ).copyWith(bottom: 24),
      content: Row(
        children: [
          (error ? AppIcons.error : AppIcons.done).apply(
              size: 24, margin: const EdgeInsets.symmetric(horizontal: 8)),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      duration: const Duration(seconds: 5),
    );
  }

  static copy(String description, BuildContext context) {
    Clipboard.setData(ClipboardData(text: description));
    Feedbacks.flushBar(
      context: context,
      message: SoftwarePayLocalization.of(context)!.copiedThisText,
      error: false,
    );
  }
}
