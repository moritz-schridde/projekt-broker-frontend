import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart' as FireFlutter;
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_provider.dart';
import 'package:projekt_broker_frontend/screens/profile/widgets/profile_change_kontaktdaten.dart';
import 'package:projekt_broker_frontend/screens/profile/widgets/profile_change_konto_depo.dart';
import 'package:projekt_broker_frontend/screens/profile/widgets/profile_change_persoenliche_daten.dart';
import 'package:projekt_broker_frontend/screens/profile/widgets/profile_premium.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';
import 'package:projekt_broker_frontend/widgets/main_top_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import '../../provider/user_info_provider.dart';
import '../../widgets/main_bottom_navigation_bar.dart';
import 'widgets/profile_labeled_text.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  openKontaktdatenPopup(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => ProfileChangeKontaktdaten());
  }

  openPersoenlicheDatenPopup(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => ProfileChangePersoenlicheDaten());
  }

  openKontoDepotPopup(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => ProfileChangeKontoDepot());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer2<ProfileProvider, UserInfoProvider>(
      builder: (context, profileProvider, userInfoProvider, _) => Scaffold(
        appBar: MainTopNavigationBar.appBar(
          context: context,
          title: "Mein Profil",
        ),
        body: FireFlutter.ProfileScreen(
          providerConfigs: FirebaseAuthService.providerConfigurations,
          children: [
            OutlinedButton(
              onPressed: () => context
                  .read<FirebaseAuthService>()
                  .getBearerToken()
                  .then(print),
              child: Text("log Bearer"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kontaktdaten",
                    style: theme.textTheme.headline6!
                        .copyWith(color: theme.primaryColor),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit_outlined,
                      color: theme.primaryColor,
                    ),
                    onPressed: () => openKontaktdatenPopup(context),
                  ),
                ],
              ),
            ),
            ProfileLabeledText(
              label: "Name",
              value: userInfoProvider.userInfo?.name ?? "N/A",
            ),
            ProfileLabeledText(
              label: "E-Mail",
              value: userInfoProvider.userInfo?.email ?? "N/A",
            ),
            ProfileLabeledText(
              label: "Mobilnummer",
              value: userInfoProvider.userInfo?.phone ?? "N/A",
            ),
            Divider(
              color: theme.primaryColor.withOpacity(0.6),
              thickness: 2,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Persönliche Daten",
                    style: theme.textTheme.headline6!
                        .copyWith(color: theme.primaryColor),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit_outlined,
                      color: theme.primaryColor,
                    ),
                    onPressed: () => openPersoenlicheDatenPopup(context),
                  ),
                ],
              ),
            ),
            ProfileLabeledText(
              label: "Anschrift",
              value:
                  '${userInfoProvider.userInfo?.street ?? "N/A"} ${userInfoProvider.userInfo?.number ?? "N/A"}, ${userInfoProvider.userInfo?.postalcode ?? "N/A"} ${userInfoProvider.userInfo?.city ?? "N/A"}, ${userInfoProvider.userInfo?.country ?? "N/A"}',
            ),
            ProfileLabeledText(
              label: "Staatsangehörigkeit",
              value: userInfoProvider.userInfo?.country ?? "N/A",
            ),
            ProfileLabeledText(
              label: "Steuernummer",
              value: userInfoProvider.userInfo?.bankAccount.taxNumber ?? "N/A",
            ),
            ProfileLabeledText(
                label: "Geburtsdatum",
                value:
                    '${userInfoProvider.userInfo?.birthDay ?? "N/A"}.${userInfoProvider.userInfo?.birthMonth ?? "N/A"}.${userInfoProvider.userInfo?.birthYear ?? "N/A"}'),
            Divider(
              color: theme.primaryColor.withOpacity(0.6),
              thickness: 2,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Konten & Depot",
                    style: theme.textTheme.headline6!
                        .copyWith(color: theme.primaryColor),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit_outlined,
                      color: theme.primaryColor,
                    ),
                    onPressed: () => openKontoDepotPopup(context),
                  ),
                ],
              ),
            ),
            ProfileLabeledText(
              label: "Verknüpftes Konto",
              value: userInfoProvider.userInfo?.bankAccount.iban ?? "N/A",
            ),
            ProfileLabeledText(
              label: "Verechnungskonto",
              value: userInfoProvider.userInfo?.bankAccount.iban ?? "N/A",
            ),
            ProfileLabeledText(
              label: "Wertpapierdepot",
              value: userInfoProvider.userInfo?.bankAccount.kontoId ?? "N/A",
            ),
            ProfilePremium(),
          ],
        ),
        bottomNavigationBar: MainBottomNavigationBar(),
      ),
    );
  }
}
