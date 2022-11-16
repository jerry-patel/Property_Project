import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


/// Hide Keyboard
void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}


/// Open Gmail
Future<void> gmailOnTapFunction() async {
  const url = "mailto:lebechproperty@gmail.com";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

/// Open Phone Dialer
Future<void> phoneOnTapFunction() async {
  const url = "tel:6352237711";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


/// Open Telegram
telegramOnTapFunction() async {
  const url = "https://telegram.me/lebechpropertyy";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

/// Open WhatsApp
whatsappOnTapFunction() async {
  const url = "https://wa.me/916352237711";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}