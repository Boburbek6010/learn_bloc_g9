import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_g9/auth/bloc/auth_bloc.dart';
import 'package:learn_bloc_g9/auth/ui/pages/login_page.dart';
import 'package:learn_bloc_g9/auth/ui/widgets/custom_text_field.dart';
import 'package:learn_bloc_g9/counter/counter_page.dart';

import '../../../home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _signupBloc = AuthBloc();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _signupBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Authentication App'),
          backgroundColor: Colors.redAccent,
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is IsLoadingState) {

              showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
              );
            }
            if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Error: ${state.error}"),
                ),
              );
            }
            if(state is SuccessState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Successfully Registered"),
                ),
              );
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
            }
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create New User',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: fullNameController,
                        text: 'Full name',
                        textInputType: TextInputType.text,
                      ),
                      CustomTextField(
                        controller: emailController,
                        text: 'Email',
                        textInputType: TextInputType.text,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        text: 'Password',
                        textInputType: TextInputType.text,
                      ),
                      CustomTextField(
                        controller: phoneNumberController,
                        text: 'Phone number',
                        textInputType: TextInputType.number,
                      ),
                      Container(
                        height: 100,
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: const MaterialStatePropertyAll(6),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.redAccent,
                                      ),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  _signupBloc.add(
                                    SignUpEvent(
                                      email: emailController.text,
                                      fullName: fullNameController.text,
                                      password: passwordController.text,
                                      phoneNumber: phoneNumberController.text,
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: const Text(
                                    'Signup',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const LoginPage();
                                    },
                                  ),
                                );
                              },
                              child: const Text(
                                'Already have an account?',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ],
                        ),
                      )
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
