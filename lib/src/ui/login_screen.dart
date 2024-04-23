import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ocr_ovd_mobile/src/router/app_route.dart';
import 'package:ocr_ovd_mobile/src/router/app_route.gr.dart';
import 'package:ocr_ovd_mobile/src/router/injection.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Sample"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormBuilderTextField(
                    name: "UserName",
                    decoration: const InputDecoration(labelText: "UserName"),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                      name: "Password",
                      decoration: const InputDecoration(labelText: "Password"),
                      obscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(8)
                      ])),
                  const SizedBox(height: 10),
                  MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          String? value = _formKey
                              .currentState?.fields["UserName"]?.value
                              .toString();
                          getIt<AppRouter>().push(const HomeRoute());
                          //Fluttertoast.showToast(msg: value!);
                        }
                      },
                      child: const Text("Login"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
