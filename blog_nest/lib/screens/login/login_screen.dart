import 'package:blog_nest/extensions/string_ext.dart';
import 'package:blog_nest/reusable_components/custom_btn_view.dart';
import 'package:blog_nest/reusable_components/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../extensions/color_ext.dart';
import '../../managers/nav_mgr.dart';
import '../../utils/typedefs.dart';
import 'login_vm.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Welcome Back').styled(size: 20, weight: FW.w700),
              const Text('Glad to see you again')
                  .styled(size: 15, weight: FW.w300),
              _FormView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormView extends StatelessWidget {
  _FormView();
  final vm = LoginVM();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: C.itemBg,
            borderRadius: BR.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CAL.start,
              children: [
                const Text('Username').styled(size: 15, weight: FW.w500),
                CustomTextField(
                  controller: vm.nameController,
                  hint: 'Enter your username',
                ),
                const SizedBox(height: 16),
                const Text('Password').styled(size: 15, weight: FW.w500),
                CustomTextField(
                  controller: vm.pwdController,
                  hint: 'Enter your password',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: CustomBtnView(
                            callBack: () async {
                              await vm.login();
                              if (vm.shouldNavigate) {
                                if (!context.mounted) return;
                                vm.navMgr.navigate(
                                    context: context, dest: Destination.home);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
