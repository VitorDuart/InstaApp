import 'package:flutter/material.dart';
import 'package:insta_app/app/models/user.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  List<Widget> pages;
  int index = 0;
  String email;
  String fullname;
  String password;
  String birthday;

  @override
  void initState() {
    super.initState();
    pages = [
      PageOne(emailCallback: emailCallback),
      PageTwo(namePassCallback: namePassCallback),
      PageThree(),
    ];
  }

  void emailCallback(email) {
    setState(() {
      this.email = email;
      this.index += 1;
    });
  }

  void namePassCallback(fullname, password) {
    setState(() {
      this.fullname = fullname;
      this.password = password;
      this.index += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: pages[index],
        );
      },
    );
  }
}

class PageOne extends StatefulWidget {
  PageOne({this.emailCallback});
  final emailCallback;

  @override
  PageOneState createState() => PageOneState();
}

class PageOneState extends State<PageOne> with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: 'Email'),
                            onSaved: (value) => email = value,
                          ),
                          Container(
                            child: TextButton(
                              child: Text('Next'),
                              onPressed: () {
                                _keyForm.currentState.save();
                                widget.emailCallback(email);
                              },
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
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatefulWidget {
  PageTwo({this.namePassCallback});

  final namePassCallback;
  @override
  PageTwoState createState() => PageTwoState();
}

class PageTwoState extends State<PageTwo> {
  final _keyForm = GlobalKey<FormState>();
  String fullName;
  String password;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(child: Text('NAME AND PASSWORD')),
          Form(
            key: _keyForm,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Full name'),
                  onSaved: (value) => fullName = value,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Password'),
                  onSaved: (value) => password = value,
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
                  child: TextButton(
                    child: Text('Continue'),
                    onPressed: () {
                      _keyForm.currentState.save();
                      widget.namePassCallback(fullName, password);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageThree extends StatefulWidget {
  @override
  PageThreeState createState() => PageThreeState();
}

class PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
