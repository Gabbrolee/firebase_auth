int repeat( int number,  int input){
  var counter = 0;
  while(counter < number ){
    input *= input;
    counter++;
  }
  return input;
}

void main(){
  final result = repeat(0,  2);
  print(result);
}