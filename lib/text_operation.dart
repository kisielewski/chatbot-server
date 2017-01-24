import 'dart:math';

import 'package:chatbot_server/global.dart';

String selectAnswer(String data){
	if(data.length < 3) return selectEqual(data);
	data = data.toLowerCase();
	var answers = new List();
	double maximum = 0.0;
	double current;
	var list  = database.readAsLinesSync();
	for(var i = 0; i < list.length; i++){
		if(list[i].split(";")[0].length >= 3){
			current = jaccardIndex(data, list[i].split(";")[0].toLowerCase());
			if(current > maximum){
				maximum = current;
				answers.clear();
			} else if(current < maximum) continue;
			answers.add(list[i].split(";")[1]);
		} 
	}
	var rng = new Random();
	return answers[rng.nextInt(answers.length)];
}

String selectEqual(String data){
	data = data.toLowerCase();
	var answers = new List();
	var list  = database.readAsLinesSync();
	for(var i = 0; i < list.length; i++){
		if(list[i].split(";")[0].toLowerCase() == data) answers.add(list[i].split(";")[1]);
	}
	var rng = new Random();
	if(answers.length == 0) return "Oh.";
	return answers[rng.nextInt(answers.length)];
}

double jaccardIndex(String a, String b){
	var isB = new List(b.length-1);
	for(var i = 0; i < isB.length; i++) isB[i] = true;
	int sum = 0;
	for(var i = 0; i < a.length-2; i++){
		for(var j = 0; j < b.length-2; j++){
			if(a[i]==b[j] && a[i+1]==b[j+1] && a[i+2]==b[j+2] && isB[j]){
				sum++;
				isB[j] = false;
			}
		}
	}
	double x = sum/((a.length-2)+(b.length-2)-sum);
	return x;
}
