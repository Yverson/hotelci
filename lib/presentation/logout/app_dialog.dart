import 'package:flutter/material.dart';
import 'package:get/get.dart';

logoutDialog(
        {@required String? title,
        @required String? description,
        @required Color? color,
        Function? onTap,
        context}) =>
    showDialog(
      barrierColor:const  Color.fromRGBO(0, 0, 0, 0.80),
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: SizedBox(
            height: 120.0,
            child: Column(
              children: [
                msgArea(title, description, context),
               const  Spacer(),
                footer(context, color, onTap)
              ],
            ),
          ),
        );
      },
    );

headerBar(color) => Container(
      color: color,
      height: 8.0,
    );

msgArea(title, description, context) => Padding(
      padding:const  EdgeInsets.all(10),
      child: Row(
        children: [
        const   SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             const    SizedBox(width: double.infinity),
                Text(
                  title,
                  style:const  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
               const  SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

footer(context, color, onTap) => Container(
      padding:const  EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius:const  BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        color: Colors.grey[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                border: Border.all(color: color),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(5.0),
              padding:const  EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: Text(
                'no'.tr,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () => onTap(),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: color),
                borderRadius: BorderRadius.circular(2.0),
                color: color,
              ),
              margin:const  EdgeInsets.symmetric(vertical: 5.0),
              padding:const  EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: Text(
                'yes'.tr,
                style:const  TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
