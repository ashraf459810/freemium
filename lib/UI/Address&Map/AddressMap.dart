import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:freemium/UI/Address&Map/GetLocationBloc/getloation_bloc.dart';
import 'package:freemium/UI/Home/Home.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';

import 'package:freemium/injection.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressMap extends StatefulWidget {
  AddressMap({Key key}) : super(key: key);

  @override
  _AddressMapState createState() => _AddressMapState();
}

class _AddressMapState extends State<AddressMap> {
  final bloc = sl<GetloationBloc>();
  Set<Marker> markers = {};
  TextEditingController housenocontroller = TextEditingController();
  String housenumber;
  LatLng currentPostion;

  @override
  void initState() {
    // getloationBloc.add(LocationEvent());
    super.initState();
  }

  ReusableWidgets reusableWidgets = ReusableWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: reusableWidgets.appbar(context, "Address"),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(children: [
              SizedBox(
                height: h(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SizedBox(
                        height: h(156),
                        width: w(136),
                        child: SvgPicture.asset("assets/images/Group 32.svg")),
                  ),
                  SizedBox(
                      height: h(156),
                      width: w(136),
                      child: SvgPicture.asset("assets/images/Group 31.svg")),
                ],
              ),
              SizedBox(
                height: h(32),
              ),
              Row(
                children: [
                  SizedBox(
                    width: w(24),
                  ),
                  Text(
                    "Location",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
              SizedBox(
                height: h(12),
              ),
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is LocationState) {
                    print("here from the state ${state.position}");
                    currentPostion = LatLng(
                        state.position.latitude, state.position.longitude);
                    var markerIdVal = "1";
                    final MarkerId markerId = MarkerId(markerIdVal);

                    // creating a new MARKER
                    final Marker marker = Marker(
                      markerId: markerId,
                      position: LatLng(
                          state.position.latitude, state.position.longitude),
                    );
                    markers.add(marker);
                  }
                  if (state is Loading) {
                    return LinearProgressIndicator(
                      backgroundColor: Colors.white,
                    );
                  }
                  if (state is Error) {
                    return Center(child: Text(state.error));
                  }
                  return Container(
                      height: h(211),
                      width: w(327),
                      child: currentPostion != null
                          ? GoogleMap(
                              zoomControlsEnabled: false,
                              markers: markers,
                              // onMapCreated: _onMapCreated,
                              initialCameraPosition: CameraPosition(
                                target: currentPostion,
                                zoom: 20,
                              ),
                            )
                          : Container(
                              child: Center(child: Text("Loading..."))));
                },
              ),
              SizedBox(
                height: h(12),
              ),
              reusableWidgets.container(housenocontroller, (val) {
                housenumber = val;
              }, "House No", "number"),
              SizedBox(
                height: h(30),
              ),
              Container(
                  width: w(45),
                  child: reusableWidgets.dots(
                      Colors.grey[400], Colors.grey[400], AppColor.button)),
              SizedBox(
                height: h(40),
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
                  },
                  child: reusableWidgets.submitbutton("Next", AppColor.button))
            ]),
          ),
        ));
  }

  double h(double h) {
    return ScreenUtil().setHeight(h);
  }

  double w(double w) {
    return ScreenUtil().setWidth(w);
  }
}
