import 'package:bloc_news_app/core/constants/app_assets.dart';
import 'package:bloc_news_app/core/extensions/app_context_extensions.dart';
import 'package:bloc_news_app/views/navigation_drawer/navigation_action.dart';
import 'package:flutter/material.dart';

class CustomNavigationDrawer extends StatelessWidget {
  final Function(NavigationAction) countryMenuClick;

  const CustomNavigationDrawer({required this.countryMenuClick, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _createDrawerHeader(context),
                _createDrawerBodyItem(context, icon: Icons.list_alt_outlined, text: context.resources.strings!.newsList, onTap: countryMenuClick, action: NavigationAction.newsPagination),
                _createDrawerBodyItem(context, icon: Icons.language, text: context.resources.strings!.menuCountry, onTap: countryMenuClick, action: NavigationAction.country),
                _createDrawerBodyItem(context, icon: Icons.newspaper_sharp, text: context.resources.strings!.newsHome, onTap: countryMenuClick, action: NavigationAction.allNewsSlider),
                _expendedDrawerBody(context, onTap: countryMenuClick),
                _expendedLanguageDrawerBody(context, onTap: countryMenuClick),
                _createDrawerBodyItem(context, icon: Icons.info_outlined, text: context.resources.strings!.menuAboutUs, onTap: countryMenuClick, action: NavigationAction.about),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }

  Widget _createDrawerHeader(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Image.asset(
        width: double.infinity,
        AppAssets.imgBreakingNews,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _createDrawerBodyItem(BuildContext context, {required IconData icon, required String text, required Function(NavigationAction) onTap, required NavigationAction action}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: context.resources.dimension.smallMargin),
            child: Text(
              text,
              style: context.resources.style.drawerTextStyle,
            ),
          )
        ],
      ),
      onTap: () => onTap(action),
    );
  }

  Widget _createExpandDrawerChildBodyItem(BuildContext context, {required String text, required Function(NavigationAction) onTap, required NavigationAction action}) {
    return ListTile(
      title: Text(text),
      onTap: () => onTap(action),
    );
  }

  Widget _expendedDrawerBody(BuildContext context, {required Function(NavigationAction) onTap}) {
    return ExpansionTile(
      //Transform used to remove space between title & icon
      title: Transform(
        // transform: Matrix4.translationValues(-24, 0.0, 0.0),
        transform: Matrix4.translationValues(-18, 0.0, 0.0),
        child: Padding(
          padding: EdgeInsets.only(left: context.resources.dimension.smallMargin),
          child: Text(
            context.resources.strings!.menuSubCategories,
            style: context.resources.style.drawerTextStyle,
          ),
        ),
      ),
      leading: const Icon(Icons.category_outlined), //add icon
      childrenPadding: const EdgeInsets.only(left: 34), //children padding
      children: [
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.subMenuAll, onTap: countryMenuClick, action: NavigationAction.allNews),
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.subMenuBusiness, onTap: countryMenuClick, action: NavigationAction.business),
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.subMenuEntertainment, onTap: countryMenuClick, action: NavigationAction.entertainment),
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.subMenuHealth, onTap: countryMenuClick, action: NavigationAction.health),
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.subMenuScience, onTap: countryMenuClick, action: NavigationAction.science),
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.subMenuSports, onTap: countryMenuClick, action: NavigationAction.sports),
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.subMenuTechnology, onTap: countryMenuClick, action: NavigationAction.technology),
      ],
    );
  }

  Widget _expendedLanguageDrawerBody(BuildContext context, {required Function(NavigationAction) onTap}) {
    return ExpansionTile(
      //Transform used to remove space between title & icon
      title: Transform(
        transform: Matrix4.translationValues(-18, 0.0, 0.0),
        child: Padding(
          padding: EdgeInsets.only(left: context.resources.dimension.smallMargin),
          child: Text(
            context.resources.strings!.language,
            style: context.resources.style.drawerTextStyle,
          ),
        ),
      ),
      leading: const Icon(Icons.list_rounded), //add icon
      childrenPadding: const EdgeInsets.only(left: 34), //children padding
      children: [
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.lngEnglish, onTap: countryMenuClick, action: NavigationAction.lngEnglish),
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.lngHindi, onTap: countryMenuClick, action: NavigationAction.lngHindi),
      ],
    );
  }
}
