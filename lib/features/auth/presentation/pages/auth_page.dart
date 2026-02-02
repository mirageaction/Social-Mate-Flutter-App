import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/features/auth/presentation/tabs/sign_in_tab.dart';
import 'package:social_mate_app/features/auth/presentation/tabs/sign_up_tab.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Column(
            children: [
              20.verticalSpace,
              Assets.images.appLogo.image(width: 1.sw, height: 100.h),
              30.verticalSpace,
              TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: [
                  Tab(text: 'Sign in'),
                  Tab(text: 'Sign up'),
                ],
              ),

              Expanded(
                child: TabBarView(
                  clipBehavior: Clip.none,
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(child: SignInTab()),
                    SingleChildScrollView(child: SignUpTab()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
