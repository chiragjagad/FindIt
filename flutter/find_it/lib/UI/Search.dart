import 'package:find_it/UI/ClaimPage.dart';
import 'package:find_it/model/PostItem.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../app_theme.dart';
import '../firebase_api.dart';
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String search="";
  List<PostItem> items=[];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              // Container(
              //   padding: EdgeInsets.only(
              //       top: MediaQuery.of(context).padding.top,
              //       left: 16,
              //       right: 16),
              //   child: Text(""),
              // ),
              SizedBox(
                height: 0.07*MediaQuery.of(context).size.height,
              ),
              getAppBarUI(),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        getSearchBarUI(),
                        StreamBuilder<List<PostItem>>(
                            stream: FirebaseApi.getItems(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Center(child: CircularProgressIndicator());
                                default:
                                  if (snapshot.hasError) {
                                    print(snapshot.error);
                                    return Text('Something Went Wrong Try later');
                                  } else {
                                    final items1 = snapshot.data;

                                    if (items1.isEmpty) {
                                      return Text('No Items Found');
                                    } else if(search.isEmpty){
                                      return Container();
                                    }
                                    else{
                                      print(search);

                                      for(PostItem item in items1){
                                        if(item.description.toLowerCase().contains(new RegExp(r''+search, caseSensitive: false))||
                                            search.contains(new RegExp(r''+item.description, caseSensitive: false))){
                                          items.add(item);
                                          break;
                                        }
                                        for(String type in item.types){
                                          print(item.types);
                                          if(type.contains(new RegExp(r''+search, caseSensitive: false))||
                                              search.contains(new RegExp(r''+type, caseSensitive: false))){
                                            items.add(item);
                                            break;
                                          }
                                        }
                                      }

                                      return ListView.builder(
                                        itemCount: items.length,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(top: 16),
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            buildItem(context, items[index]),
                                        // itemBuilder: (context, index) {
                                        //   return ConversationList(
                                        //     name: chatUsers[index].name,
                                        //     messageText: chatUsers[index].messageText,
                                        //     imageUrl: chatUsers[index].image,
                                        //     time: chatUsers[index].time,
                                        //     isMessageRead:
                                        //         (index == 0 || index == 3) ? true : false,
                                        //   );
                                        // },
                                      );}
                                  }
                              }
                            }),

                        // Flexible(
                        //   child: getPopularCourseUI(),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildItem(BuildContext context, PostItem item) {
    return Card(

      margin: EdgeInsets.only(bottom: 10,left: 5,right: 5),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ClaimPage(item: item,);
          }));
        },
        child: Container(
          height: MediaQuery.of(context).size.height*0.10,
          padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[

                    Expanded(
                      child: Container(

                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text(
                              item.description,
                              style: TextStyle(fontWeight: FontWeight.w400,
                                fontSize: 20,
                                letterSpacing: 0.27,
                                color: AppTheme.darkerText,),
                            ),
                            Text(
                              'Found At:'+item.locfound,
                              style:TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                letterSpacing: 0.2,
                                color: AppTheme.grey,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            // Text(
                            //   widget.messageText,
                            //   style: TextStyle(
                            //       fontSize: 13,
                            //       color: Colors.grey.shade600,
                            //       fontWeight: FontWeight.normal),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Text(
              //   widget.time,
              //   style: TextStyle(
              //       fontSize: 12,
              //       fontWeight: FontWeight.normal),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget getCategoryUI() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       Padding(
  //         padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
  //         child: Text(
  //           'Category',
  //           textAlign: TextAlign.left,
  //           style: TextStyle(
  //             fontWeight: FontWeight.w600,
  //             fontSize: 22,
  //             letterSpacing: 0.27,
  //             color: AppTheme.darkerText,
  //           ),
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 16,
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 16, right: 16),
  //         child: Row(
  //           children: <Widget>[
  //
  //             const SizedBox(
  //               width: 16,
  //             ),
  //             getButtonUI(
  //                 CategoryType.coding, categoryType == CategoryType.coding),
  //             const SizedBox(
  //               width: 16,
  //             ),
  //             getButtonUI(
  //                 CategoryType.basic, categoryType == CategoryType.basic),
  //           ],
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 16,
  //       ),
  //       CategoryListView(
  //         callBack: () {
  //           moveTo();
  //         },
  //       ),
  //     ],
  //   );
  // }

  // Widget getPopularCourseUI() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           'Popular Course',
  //           textAlign: TextAlign.left,
  //           style: TextStyle(
  //             fontWeight: FontWeight.w600,
  //             fontSize: 22,
  //             letterSpacing: 0.27,
  //             color: AppTheme.darkerText,
  //           ),
  //         ),
  //         Flexible(
  //           child: PopularCourseListView(
  //             callBack: () {
  //               moveTo();
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // void moveTo() {
  //   Navigator.push<dynamic>(
  //     context,
  //     MaterialPageRoute<dynamic>(
  //       builder: (BuildContext context) => CourseInfoScreen(),
  //     ),
  //   );
  // }

  // Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
  //   String txt = '';
  //   if (CategoryType.ui == categoryTypeData) {
  //     txt = 'Ui/Ux';
  //   } else if (CategoryType.coding == categoryTypeData) {
  //     txt = 'Coding';
  //   } else if (CategoryType.basic == categoryTypeData) {
  //     txt = 'Basic UI';
  //   }
  //   return Expanded(
  //     child: Container(
  //       decoration: BoxDecoration(
  //           color: isSelected
  //               ? AppTheme.nearlyBlue
  //               : AppTheme.nearlyWhite,
  //           borderRadius: const BorderRadius.all(Radius.circular(24.0)),
  //           border: Border.all(color: DesignCourseAppTheme.nearlyBlue)),
  //       child: Material(
  //         color: Colors.transparent,
  //         child: InkWell(
  //           splashColor: Colors.white24,
  //           borderRadius: const BorderRadius.all(Radius.circular(24.0)),
  //           onTap: () {
  //             setState(() {
  //               categoryType = categoryTypeData;
  //             });
  //           },
  //           child: Padding(
  //             padding: const EdgeInsets.only(
  //                 top: 12, bottom: 12, left: 18, right: 18),
  //             child: Center(
  //               child: Text(
  //                 txt,
  //                 textAlign: TextAlign.left,
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.w600,
  //                   fontSize: 12,
  //                   letterSpacing: 0.27,
  //                   color: isSelected
  //                       ? DesignCourseAppTheme.nearlyWhite
  //                       : DesignCourseAppTheme.nearlyBlue,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18,right: 18),
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width *0.8,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8,right: 10),
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
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      //color: AppTheme.nearlyBlue,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      border: InputBorder.none,
                      helperStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: HexColor('#B9BABC'),
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 0.2,
                        color: HexColor('#B9BABC'),
                      ),
                    ),
                    onChanged: (val){
                      search=val;

                    },
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                items=[];

              });
            },
            child: Container(
              margin: EdgeInsets.only(top:8),
              //padding: EdgeInsets.only(top:8,bottom: 8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.nearlyBlue ,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                 Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child:
                Text(
                  'Search for your lost item',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    letterSpacing: 0.27,
                    color: AppTheme.darkerText,
                  ),
                ),

            ),

          // Container(
          //   width: 60,
          //   height: 60,
          //   child: Image.asset('assets/design_course/userImage.png'),
          // ),

        ],
      ),
    );
  }
}
