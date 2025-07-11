import 'package:flutter/widgets.dart';

abstract class ProfileScreenEvents {}

class OnEditInformationNavigationClicked extends ProfileScreenEvents {}

class OnPlantingGuideNavigationClicked extends ProfileScreenEvents {}

class OnTransactionsHistoryNavigationClicked extends ProfileScreenEvents {}

class OnQaNavigationClicked extends ProfileScreenEvents {}

class OnTermsAndSecurityNavigationClicked extends ProfileScreenEvents {}

class OnSecurityPolicyNavigationClicked extends ProfileScreenEvents {}

class OnLogOutClicked extends ProfileScreenEvents {
  BuildContext context;

  OnLogOutClicked({required this.context});
}
