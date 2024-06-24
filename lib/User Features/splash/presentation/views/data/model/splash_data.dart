import 'package:easy_localization/easy_localization.dart';

import '../../../../../../translations/local_keys.g.dart';
import 'splash_model.dart';

class SplashData {
  static List<OnBoardingItemModel> onBoardingItemList = [
    OnBoardingItemModel(
      image: 'assets/images/AnimationEcommerce.json',
      title: LocaleKeys.GhosnGreenParadise.tr(),
      subTitle: LocaleKeys.GhosnGreenParadiseDescription.tr(),
    ),
    OnBoardingItemModel(
      image: 'assets/images/Animationscan.json',
      title: LocaleKeys.YourPlantsDoctor.tr(),
      subTitle: LocaleKeys.YourPlantsDoctorDesc.tr(),
    ),
    OnBoardingItemModel(
      image: 'assets/images/Animationcommunity.json',
      title: LocaleKeys.CommunityPlantLovers.tr(),
      subTitle: LocaleKeys.CommunityPlantLoversDesc.tr(),
    ),
    OnBoardingItemModel(
      image: 'assets/images/Animationreminder.json',
      title: LocaleKeys.YourHiddenAssistant.tr(),
      subTitle: LocaleKeys.YourHiddenAssistantDesc.tr(),
    ),
  ];
}
