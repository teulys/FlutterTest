import 'package:components/src/pages/container_pages.dart';
import 'package:components/src/pages/field_page.dart';
import 'package:components/src/pages/listview_page.dart';
import 'package:components/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/card_page.dart';

Map<String, WidgetBuilder> getRouterPages() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'container': (BuildContext context) => ContainerPage(),
    'fields': (BuildContext context) => FieldsPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListViewPage(),
  };
}
