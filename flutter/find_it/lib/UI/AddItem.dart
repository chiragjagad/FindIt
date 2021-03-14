import 'package:find_it/model/PostItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:find_it/firebase_api.dart';
import '../app_theme.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  PostItem postItem=new PostItem();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  static List<String> typesList = [null];

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppTheme.nearlyWhite,
        child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(children: <Widget>[
                SizedBox(
                  height: 0.07 * MediaQuery.of(context).size.height,
                ),
                getAppBarUI(),
                SizedBox(
                  height: 0.03 * MediaQuery.of(context).size.height,
                ),
                Form(
                  key: _formKey,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Container(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Your name:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  letterSpacing: 0.2,
                                  color: AppTheme.grey,
                                ),
                              ),
                              padding: EdgeInsets.only(left: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2.0, left: 18, right: 18, bottom: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 64,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.2),
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(13.0),
                                            bottomLeft: Radius.circular(13.0),
                                            topLeft: Radius.circular(13.0),
                                            topRight: Radius.circular(13.0),
                                          ),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 16, right: 16),
                                                child: TextFormField(

                                                  style: TextStyle(
                                                    fontFamily: 'WorkSans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17,
                                                  ),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    //labelText: 'Search for course',
                                                    border: InputBorder.none,
                                                  ),
                                                  validator: (v) {
                                                    if (v.trim().isEmpty)
                                                      return 'Please enter something';
                                                    return null;
                                                  },
                                                  onChanged: (val) {
                                                    setState(() {
                                                      postItem.foundby = val;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Text(
                                "Short description of the item:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  letterSpacing: 0.2,
                                  color: AppTheme.grey,
                                ),
                              ),
                              padding: EdgeInsets.only(left: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2.0, left: 18, right: 18, bottom: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 64,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.2),
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(13.0),
                                            bottomLeft: Radius.circular(13.0),
                                            topLeft: Radius.circular(13.0),
                                            topRight: Radius.circular(13.0),
                                          ),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 16, right: 16),
                                                child: TextFormField(

                                                  style: TextStyle(
                                                    fontFamily: 'WorkSans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17,
                                                  ),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    //labelText: 'Search for course',
                                                    border: InputBorder.none,
                                                  ),
                                                  validator: (v) {
                                                    if (v.trim().isEmpty)
                                                      return 'Please enter something';
                                                    return null;
                                                  },
                                                  onChanged: (val) {
                                                    setState(() {
                                                       postItem.description= val;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Text(
                                "Place where you found it:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  letterSpacing: 0.2,
                                  color: AppTheme.grey,
                                ),
                              ),
                              padding: EdgeInsets.only(left: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2.0, left: 18, right: 18, bottom: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 64,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.2),
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(13.0),
                                            bottomLeft: Radius.circular(13.0),
                                            topLeft: Radius.circular(13.0),
                                            topRight: Radius.circular(13.0),
                                          ),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 16, right: 16),
                                                child: TextFormField(

                                                  style: TextStyle(
                                                    fontFamily: 'WorkSans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17,
                                                  ),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    //labelText: 'Search for course',
                                                    border: InputBorder.none,
                                                  ),
                                                  validator: (v) {
                                                    if (v.trim().isEmpty)
                                                      return 'Please enter something';
                                                    return null;
                                                  },
                                                  onChanged: (val) {
                                                    setState(() {
                                                      postItem.locfound = val;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Text(
                                "Location where you dropped it off:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  letterSpacing: 0.2,
                                  color: AppTheme.grey,
                                ),
                              ),
                              padding: EdgeInsets.only(left: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2.0, left: 18, right: 18, bottom: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 64,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.2),
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(13.0),
                                            bottomLeft: Radius.circular(13.0),
                                            topLeft: Radius.circular(13.0),
                                            topRight: Radius.circular(13.0),
                                          ),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 16, right: 16),
                                                child: TextFormField(

                                                  style: TextStyle(
                                                    fontFamily: 'WorkSans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17,
                                                  ),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    //labelText: 'Search for course',
                                                    border: InputBorder.none,
                                                  ),
                                                  validator: (v) {
                                                    if (v.trim().isEmpty)
                                                      return 'Please enter something';
                                                    return null;
                                                  },
                                                  onChanged: (val) {
                                                    setState(() {
                                                      postItem.locdeposited = val;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Text(
                                "Owner (in case identification is found):",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  letterSpacing: 0.2,
                                  color: AppTheme.grey,
                                ),
                              ),
                              padding: EdgeInsets.only(left: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2.0, left: 18, right: 18, bottom: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.9,
                                    height: 64,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.2),
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(13.0),
                                            bottomLeft: Radius.circular(13.0),
                                            topLeft: Radius.circular(13.0),
                                            topRight: Radius.circular(13.0),
                                          ),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 16, right: 16),
                                                child: TextFormField(

                                                  style: TextStyle(
                                                    fontFamily: 'WorkSans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17,
                                                  ),
                                                  keyboardType:
                                                  TextInputType.text,
                                                  decoration: InputDecoration(
                                                    //labelText: 'Search for course',
                                                    border: InputBorder.none,
                                                  ),
                                                  // validator: (v) {
                                                  //   if (v.trim().isEmpty)
                                                  //     return 'Please enter something';
                                                  //   return null;
                                                  // },
                                                  onChanged: (val) {
                                                    setState(() {
                                                      postItem.owner = val;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 18),
                              child: Text(
                                'Add Types (Max 5)',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  letterSpacing: 0.2,
                                  color: AppTheme.grey,
                                ),
                              ),
                            ),
                            ..._getFriends(),
                            Container(

                              padding: EdgeInsets.only(top:10,bottom: 10),
                              child: Center(
                                child: FlatButton(
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {

                                      postItem.types=typesList;
                                      postItem.datetime=DateTime.now();
                                      postItem.claimedby="";
                                      postItem.claimers=[];
                                      postItem.admin="DWctr1yJVoaV46SKQxQ5";
                                      _formKey.currentState.reset();
                                      await FirebaseApi.uploadItem(postItem);
                                    }
                                  },
                                  child: Text('Submit',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 0.025 * (MediaQuery.of(context).size.height)),),

                                  color: AppTheme.nearlyBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  minWidth: 0.4 * (MediaQuery.of(context).size.width),
                                  height: 0.06 * (MediaQuery.of(context).size.height),
                                ),
                              ),
                            ),
                            // Flexible(
                            //   child: getPopularCourseUI(),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            )));
  }

  List<Widget> _getFriends() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < typesList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Row(
          children: [
            FriendTextFields(i),

            // we need add button at last friends row
            _addRemoveButton(i == 0, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(

      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          typesList.insert(0, null);
        } else
          typesList.removeAt(index);
        setState(() {});
      },
      child: Container(

        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? AppTheme.nearlyBlue : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Found an item you think is lost?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: 0.2,
                    color: AppTheme.grey,
                  ),
                ),
                Text(
                  'Add It Here',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    letterSpacing: 0.27,
                    color: AppTheme.darkerText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/design_course/userImage.png'),
          )
        ],
      ),
    );
  }
}

class FriendTextFields extends StatefulWidget {
  final int index;

  FriendTextFields(this.index);

  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = _AddItemState.typesList[widget.index] ?? '';
    });

    return Padding(
        padding:
            const EdgeInsets.only(top: 2.0, left: 18, right: 8, ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 64,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(13.0),
                        bottomLeft: Radius.circular(13.0),
                        topLeft: Radius.circular(13.0),
                        topRight: Radius.circular(13.0),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: TextFormField(
                                controller: _nameController,
                                onChanged: (v) {
                                  _AddItemState.typesList[widget.index] = v;

                                },

                                decoration: InputDecoration(
                                    hintText: ''),
                                validator: (v) {
                                  if (v.trim().isEmpty)
                                    return 'Please enter something';
                                  return null;
                                },
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]));
  }
}
