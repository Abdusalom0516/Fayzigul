import 'package:flutter/widgets.dart';

abstract class VerifyEmailEvents {}

class OnCheckVerifiedClicked extends VerifyEmailEvents {
  BuildContext context;

  OnCheckVerifiedClicked({required this.context});
}
