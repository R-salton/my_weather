

import 'package:flutter/material.dart';

String getDay(int day){

  if(day ==  1){
    return "Monaday";
  }

  else if(day == 2){
    return "Tuesday";
  }
  else if (day == 3) {
    return "Thurseday";
  }
  else if (day == 4) {
    return "Wednesday";
  }
  else if (day == 5) {
    return "Friday";
  }
  else if (day == 6) {
    return "Saturday";
  }
  else if (day == 7) {
    return "Sunday";
  }
  else{
    return "Error";
  }
}