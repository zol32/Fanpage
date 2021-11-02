import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  late TextEditingController _emailController,
      _reemailController,
      _passwordController,
      _repasswordController,
      _firstnameController,
      _lastnameController,
      _pictureController,
      _bioController,
      _hometownController,
      _ageController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _reemailController = TextEditingController();
    _passwordController = TextEditingController();
    _repasswordController = TextEditingController();
    _firstnameController = TextEditingController();
    _lastnameController = TextEditingController();
    _pictureController = TextEditingController();
    _bioController = TextEditingController();
    _hometownController = TextEditingController();
    _ageController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _reemailController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _pictureController.dispose();
    _bioController.dispose();
    _hometownController.dispose();
    _ageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
        ),
        body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  const SizedBox(height: 20.0),
                  TextFormField(
                    autocorrect: false,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "EMAIL ADDRESS",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Enter Email'),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    autocorrect: false,
                    controller: _reemailController,
                    validator: (value) {
                      if (value == null || value != _reemailController.text) {
                        return 'Email addresses do not match';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "RE ENTER EMAIL ADDRESS",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Re-Enter Email'),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    autocorrect: false,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "ENTER PASSWORD",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Enter Password'),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    autocorrect: false,
                    controller: _repasswordController,
                    validator: (value) {
                      if (value == null || value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "VERIFY PASSWORD",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Verify Password'),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    autocorrect: false,
                    controller: _firstnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "Enter Firstname",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Enter Firstname'),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    autocorrect: false,
                    controller: _lastnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lastname cannot be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "Enter Lastname",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Enter Lastname'),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    autocorrect: false,
                    controller: _pictureController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Picture URL cannot be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "Enter Picture URL",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Enter Picture URL'),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    autocorrect: false,
                    controller: _bioController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bio cannot be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "Enter Bio",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Enter Bio'),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    autocorrect: false,
                    controller: _hometownController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Hometown cannot be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "Enter Hometown",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Enter Hometown'),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    autocorrect: false,
                    controller: _ageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Age cannot be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "Enter Age",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Enter Age'),
                  ),
                  const SizedBox(height: 30.0),
                  OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')));

                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Registering')));
                          register();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Registered')));
                        });
                      }
                    },
                    child: const Text('Submit'),
                  )
                ])))));
  }

  Future<void> register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      _db
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({
            "first_name": _firstnameController.text,
            "last_name": _lastnameController.text,
            "picture": _pictureController.text,
            "bio": _bioController.text,
            "hometown": _hometownController.text,
            "age": _ageController.text,
          })
          .then((value) => null)
          .onError((error, stackTrace) => null);
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Something Else")));
    } catch (e) {
      //print(e);
    }

    setState(() {});
  }

  // DateTime selectedDate = DateTime.now();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }
}
