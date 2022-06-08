import 'package:flutter/widgets.dart';
import 'package:login/app/bloc/app_bloc.dart';
import 'package:login/app/pages/home/home_page.dart';
import 'package:login/app/pages/login/login_page.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
