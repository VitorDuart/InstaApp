import 'package:flutter/material.dart';
import 'package:insta_app/app/models/user.dart';
import 'package:insta_app/app/services/userService.dart';
import 'package:provider/provider.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class EmailPhone extends StatefulWidget {
  @override
  EmailPhoneState createState() => EmailPhoneState();
}

class EmailPhoneState extends State<EmailPhone>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _keyForm = GlobalKey<FormState>();
  String email;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void updateUserEmail(context, user) {
    _keyForm.currentState.save();
    user.setEmail(email);
    Navigator.pushReplacementNamed(context, '/signup/user');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.06,
                right: MediaQuery.of(context).size.width * 0.06,
                top: MediaQuery.of(context).size.height * 0.2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Icon(
                      Icons.person_outlined,
                      size: 85,
                    ),
                  ),
                  TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    unselectedLabelColor: Colors.black45,
                    tabs: [Tab(text: 'EMAIL'), Tab(text: 'PHONE')],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Container(
                          child: Form(
                            key: _keyForm,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.02),
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Email',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide()),
                                    ),
                                    onSaved: (value) => email = value,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue)),
                                    child: Text(
                                      'Next',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () =>
                                        updateUserEmail(context, user),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(child: Center(child: Text('No avaible'))),
                      ],
                      controller: _tabController,
                    ),
                  ),
                  Container(
                    child: TextButton(
                      child: Text('Already have an account? Login in'),
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/'),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NamePassword extends StatefulWidget {
  @override
  NamePasswordState createState() => NamePasswordState();
}

class NamePasswordState extends State<NamePassword> {
  final _keyForm = GlobalKey<FormState>();
  String name;
  String password;
  bool check = false;

  void updateNamePassword(context, user) {
    _keyForm.currentState.save();
    user.setName(name);
    user.setPassword(password);
    Navigator.pushReplacementNamed(context, '/signup/birthday');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (ctx, user, child) {
      return Scaffold(
          body: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.06,
          right: MediaQuery.of(context).size.width * 0.06,
          top: MediaQuery.of(context).size.height * 0.2,
        ),
        child: Column(
          children: [
            Container(child: Text('NAME AND PASSWORD')),
            Form(
              key: _keyForm,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Full name',
                          border: OutlineInputBorder(borderSide: BorderSide())),
                      onSaved: (value) => name = value,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(borderSide: BorderSide())),
                      onSaved: (value) => password = value,
                    ),
                  ),
                  CheckboxListTile(
                    value: check,
                    onChanged: (newValue) {
                      setState(() {
                        check = newValue;
                      });
                    },
                    title: Text('Remember passord'),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue)),
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => updateNamePassword(context, user),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
    });
  }
}

class Birthday extends StatefulWidget {
  @override
  BirthdayState createState() => BirthdayState();
}

class BirthdayState extends State<Birthday> {
  Map<int, String> month = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };

  void updateUserBirthday(context, user) {
    user.setBirthday(currentDate.toString());
    Navigator.pushReplacementNamed(context, '/signup/done');
  }

  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (ctx, user, child) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.06,
            right: MediaQuery.of(context).size.width * 0.06,
            top: MediaQuery.of(context).size.height * 0.15,
          ),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/birthday_cake.png',
                      width: 80,
                      height: 80,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.03,
                      ),
                      child: Text('Add Your Birthdat'),
                    ),
                    Text("This won't be part of your public profile."),
                    Text("Why do I need to provide my birthday"),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.025,
                      ),
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Center(
                        child: Text(
                          month[currentDate.month] +
                              ', ' +
                              currentDate.year.toString() +
                              ' - ' +
                              (DateTime.now().year - currentDate.year)
                                  .toString() +
                              ' Years Old',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue)),
                        onPressed: () => updateUserBirthday(context, user),
                        child:
                            Text('Next', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.2,
                      child: ScrollDatePicker(
                        itemExtent: 33.0,
                        minimumYear: 1950,
                        maximumYear: currentDate.year,
                        initialDateTime: DateTime.parse("2020-05-01"),
                        isLoop: false,
                        locale: DatePickerLocale.en_us,
                        selectedBoxDecoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black87, width: 1.5)),
                        onChanged: (value) {
                          setState(() {
                            currentDate = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class Finish extends StatefulWidget {
  @override
  FinishState createState() => FinishState();
}

class FinishState extends State<Finish> {
  UserService userService = UserService();

  onPressedFinish(context, user) {
    Future<Map<String, dynamic>> response = userService.store(user);
    response.then((value) {
      print(value);
      if (value != null) {
        user.setUser(value);
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (ctx, user, child) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.06,
              right: MediaQuery.of(context).size.width * 0.06,
              top: MediaQuery.of(context).size.height * 0.38,
            ),
            child: Column(
              children: [
                Text('WELCOME TO INSTAGRAM,'),
                Container(
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.04,
                  ),
                  child: Text(user.name),
                ),
                Text(
                  'Find People to follow and start sharing photos. You can Change your username anytime',
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue)),
                    onPressed: () => onPressedFinish(context, user),
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
