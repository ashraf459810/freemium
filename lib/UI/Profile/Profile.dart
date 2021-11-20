import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:freemium/Model/UpdateProfile.dart';
import 'package:freemium/UI/Widgets%20copy/Container.dart';
import 'package:freemium/UI/Widgets%20copy/Text.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';
import 'package:toast/toast.dart';

import 'bloc/profile_bloc.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool editing = false;
  int editingnum = 0;
  TextEditingController namec = TextEditingController();
  TextEditingController birthc = TextEditingController();
  TextEditingController genderc = TextEditingController();
  TextEditingController phonec = TextEditingController();
  TextEditingController emailc = TextEditingController();
  TextEditingController addressc = TextEditingController();
  String name;
  String birth;
  String gender;
  String phone;
  String email;
  String address;
  UpdateProfile updateProfile;
  ReusableWidgets reusableWidgets = ReusableWidgets();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc()..add(GetProfileUpdateEvent(isupdate: false)),
      child: Scaffold(
        appBar: reusableWidgets.appbar(context, "Profile"),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Container(
              color: Colors.white,
              child: BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  if (state is GetProfileUpdateState) {
                    updateProfile = state.updateProfile;
                  }
                },
                builder: (context, state) {
                  if (state is ProfileInitial) {
                    return Center(
                        child: LinearProgressIndicator(
                      color: AppColor.gradient2,
                    ));
                  }

                  if (state is Loading) {
                    return Center(
                        child: LinearProgressIndicator(
                      color: AppColor.gradient2,
                    ));
                  }
                  if (state is Error) {
                    return Center(child: Text(state.error));
                  }
                  return Column(children: [
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(height: h(8)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          color: Colors.white,
                          height: h(90),
                          width: w(90),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                'https://content.fortune.com/wp-content/uploads/2018/07/gettyimages-961697338.jpg?resize=1000,666'),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "welcome ${updateProfile.userData.name}",
                              style: TextStyle(
                                  fontSize: 20.sp, fontFamily: 'SFPRO'),
                            ),
                            SizedBox(
                              height: h(8),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColor.button,
                                ),
                                Text(
                                  "${updateProfile.userData.address}",
                                  style: TextStyle(
                                      fontSize: 12.sp, fontFamily: 'SFPRO'),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        if (editingnum.isEven) {
                          editing = true;
                          setState(() {});
                          editingnum++;
                        } else {
                          editing = false;
                          setState(() {});
                          editingnum++;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Edit",
                            style: TextStyle(
                                color: AppColor.button,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SFPRO'),
                          ),
                          SizedBox(
                            width: w(10),
                          ),
                          SvgPicture.asset(
                            "assets/images/Icon awesome-edit.svg",
                            height: h(20),
                            width: w(20),
                          ),
                          SizedBox(
                            width: w(20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h(48.8),
                    ),
                    !editing
                        ? Column(
                            children: [
                              profileline("Full Name",
                                  "${updateProfile.userData.name}"),
                              SizedBox(height: h(7.8)),
                              profileline("Date of birth",
                                  "${updateProfile.userData.birthDate}"),
                              SizedBox(height: h(7.8)),
                              profileline("Gender", "Female"),
                              SizedBox(height: h(7.8)),
                              profileline("Phone Number",
                                  "${updateProfile.userData.phone}"),
                              SizedBox(height: h(7.8)),
                              profileline(
                                  "Email", "${updateProfile.userData.email}"),
                              SizedBox(height: h(7.8)),
                              profileline("Address",
                                  "${updateProfile.userData.address}"),
                            ],
                          )
                        : Column(
                            children: [
                              profileeditingline(
                                  "Full Name", name, namec, TextInputType.name),
                              SizedBox(height: h(7.8)),
                              profileeditingline("Date of birth", birth, birthc,
                                  TextInputType.datetime),
                              SizedBox(height: h(7.8)),
                              profileeditingline("gender", gender, genderc,
                                  TextInputType.name),
                              SizedBox(height: h(7.8)),
                              profileeditingline("Phone Number", phone, phonec,
                                  TextInputType.phone),
                              SizedBox(height: h(7.8)),
                              profileeditingline("Email", email, emailc,
                                  TextInputType.emailAddress),
                              SizedBox(height: h(7.8)),
                              profileeditingline("Address", address, addressc,
                                  TextInputType.name),
                              SizedBox(height: h(20)),
                              GestureDetector(
                                onTap: () {
                                  print(namec.text);
                                  if (namec.text != null ||
                                      phonec.text != null ||
                                      birthc.text != null ||
                                      genderc.text != null ||
                                      addressc.text != null ||
                                      emailc.text != null) {
                                    context.read<ProfileBloc>().add(
                                        GetProfileUpdateEvent(
                                            address: addressc.text,
                                            birth: birthc.text,
                                            email: emailc.text,
                                            gender: genderc.text,
                                            isupdate: true,
                                            mobile: phonec.text,
                                            name: namec.text));
                                  } else {
                                    Toast.show("Please fill at least one field",
                                        context);
                                  }
                                },
                                child: container(
                                    color: AppColor.button,
                                    borderRadius: 10,
                                    hight: h(40),
                                    width: w(200),
                                    child: Center(
                                      child: text(
                                          text: "Update",
                                          color: Colors.black,
                                          fontsize: 16.sp,
                                          fontfamily: "SFPRO"),
                                    )),
                              )
                            ],
                          ),
                  ]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}

Widget profileline(String hint, String value) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: w(32),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hint,
                style: TextStyle(color: AppColor.profilehine, fontSize: 16),
              ),
              SizedBox(
                height: h(8),
              ),
              Text(value,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.sp,
                      fontFamily: 'SFPRO')),
              SizedBox(
                height: h(7.5),
              ),
            ],
          ),
        ],
      ),
      Container(
        height: h(1),
        color: Colors.grey[300],
        width: w(340),
      )
    ],
  );
}

Widget profileeditingline(String hint, String value,
    TextEditingController textEditingController, TextInputType inputType) {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: (40),
          ),
          Text(
            hint,
            style: TextStyle(
                color: AppColor.profilehine,
                fontSize: 16.sp,
                fontFamily: 'SFPRO'),
          ),
        ],
      ),
      SizedBox(
        height: h(1),
      ),
      Row(
        children: [
          SizedBox(
            width: (40),
          ),
          Container(
              height: h(40),
              width: w(300),
              child: TextFormField(
                style: TextStyle(color: Colors.grey[300]),
                keyboardType: inputType,
                controller: textEditingController,
                decoration: InputDecoration(
                    hintText: ".....", border: InputBorder.none),
                onChanged: (text) {
                  value = text;
                },
              )),
        ],
      ),
      Container(
        height: h(1),
        color: Colors.grey[300],
        width: w(340),
      )
    ],
  );
}
