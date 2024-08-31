import 'package:blog_nest/extensions/string_ext.dart';
import 'package:blog_nest/reusable_components/custom_btn_view.dart';
import 'package:blog_nest/reusable_components/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../extensions/color_ext.dart';
import '../../managers/nav_mgr.dart';
import '../../utils/typedefs.dart';
import 'login_vm.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Expanded(child: Text('')),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Welcome Back')
                          .styled(size: 20, weight: FW.w700),
                      const Text('Glad to see you again')
                          .styled(size: 15, weight: FW.w300),
                      _FormView(),
                    ],
                  ),
                ),
              ),
              const Expanded(child: Text('')),
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
                      const Expanded(flex: 1, child: Text('')),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            CustomBtnView(
                              callBack: () async {
                                await vm.login();
                                if (vm.shouldNavigate) {
                                  if (!context.mounted) return;
                                  vm.navMgr.navigate(
                                      context: context, dest: Destination.home);
                                }
                              },
                            ),
                            const SizedBox(height: 32),
                            _DividerTextView()
                          ],
                        ),
                      ),
                      const Expanded(flex: 1, child: Text('')),
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

class _DividerTextView extends StatelessWidget {
  _DividerTextView();
  final vm = LoginVM();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            indent: 0,
            endIndent: 10.0,
            thickness: 1,
          ),
        ),
        TextButton(
          onPressed: () =>
              vm.navMgr.navigate(context: context, dest: Destination.home),
          child: const Text("Enter as guest").styled(size: 12),
        ),
        const Expanded(
          child: Divider(
            indent: 10.0,
            endIndent: 0,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
