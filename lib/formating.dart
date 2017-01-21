import 'dart:core';

String two_char_format(int number){
	if(number < 10) return '0'+number.toString();
	return number.toString();
}

String logfileName(){
	DateTime date = new DateTime.now();
	return 'logs/chatbot_server_'+two_char_format(date.year)+'-'+two_char_format(date.month)+'-'+two_char_format(date.day)+'_'+two_char_format(date.hour)+'_'+two_char_format(date.minute)+'.log';
}

String currentDate(){
	DateTime date = new DateTime.now();
	return two_char_format(date.year)+'-'+two_char_format(date.month)+'-'+two_char_format(date.day)+' '+two_char_format(date.hour)+':'+two_char_format(date.minute)+':'+two_char_format(date.second);
}