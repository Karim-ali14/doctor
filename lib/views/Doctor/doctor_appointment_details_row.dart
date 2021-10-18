import 'dart:convert';
import 'package:book_appointment/en.dart';
import 'package:book_appointment/main.dart';
import 'package:book_appointment/modals/DoctorAppointmentDetailsClass.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorAppointmentDetailsRow extends StatelessWidget {
  const DoctorAppointmentDetailsRow({
    Key key,
    this.data,
    this.title,
  }) : super(key: key);
  final String data, title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .apply(fontWeightDelta: 1, fontSizeDelta: 1.5),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 300,
              child: Text(
                data,
                style: Theme.of(context).textTheme.caption.apply(
                      fontWeightDelta: 2,
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.5),
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
