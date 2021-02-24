import 'package:flutter/cupertino.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos/src/pages/animations_page.dart';
import 'package:disenos/src/pages/emergency_page.dart';
import 'package:disenos/src/pages/headers_page.dart';
import 'package:disenos/src/pages/pie_charts_page.dart';
import 'package:disenos/src/pages/pinterest_page.dart';
import 'package:disenos/src/pages/slideshow_page.dart';
import 'package:disenos/src/pages/sliver_list_page.dart';

final List<_Route> pageRoutes = <_Route>[
  _Route(icon: FontAwesomeIcons.slideshare, title: 'Slideshow', page: SlideshowPage()),
  _Route(icon: FontAwesomeIcons.ambulance, title: 'Emergency', page: EmergencyPage()),
  _Route(icon: FontAwesomeIcons.drawPolygon, title: 'Animations', page: AnimationsPage()),
  _Route(icon: FontAwesomeIcons.heading, title: 'Headers', page: HeadersPage()),
  _Route(icon: FontAwesomeIcons.chartPie, title: 'Pie Charts', page: PieChartsPage()),
  _Route(icon: FontAwesomeIcons.pinterest, title: 'Pinterest', page: PinterestPage()),
  _Route(icon: FontAwesomeIcons.list, title: 'Slivers', page: SliverListPage()),
];

class _Route {
  const _Route({
    this.icon,
    this.title,
    this.page,
  });

  final IconData icon;
  final String title;
  final Widget page;
}
