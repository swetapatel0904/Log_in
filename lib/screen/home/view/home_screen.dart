import 'package:flutter/material.dart';
import 'package:log_in/screen/home/provider/home_provider.dart';
import 'package:log_in/utils/shared_helper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  LogInProvider? providerR;
  LogInProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<LogInProvider>();
    providerW = context.watch<LogInProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter email id:"),
              controller: txtEmail,
              validator: (value) {
                if (value!.isEmpty) {
                  return "email is required";
                } else if (!RegExp(
                        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$")
                    .hasMatch(value)) {
                  return "enter valid email";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Password:"),
              controller: txtPassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return "password is required";
                } else if (value!.length != 8) {
                  return "enter valid password";
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  providerR!.save(txtEmail.text,txtPassword.text);
                  txtEmail.clear();
                  txtPassword.clear();
                }, child: const Text("Save")),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(onPressed: ()async {
                  txtEmail.text=(await getEmail())! ;
                  txtPassword.text=(await getPass())!;
                }, child: const Text("Read"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
