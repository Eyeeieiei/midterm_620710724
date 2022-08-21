class sum{

  int calculateCCtoFah(double input1){
    return (input1 * (9/5) +32).round();
  }
  int calculateCCtoKel(double input1){
    return (input1 +273.15).round();
  }
  int calculateFahtoCel(double input1){
    return ((input1 -32) * 5/9).round();
  }
  int calculateFahtoKel(double input1){
    return ((input1 +459.67) *5/9).round();
  }
  int calculateKeltoCC(double input1){
    return (input1 -273.15).round();
  }
  int calculateKeltoFah(double input1){
    return (input1 * (9/5) -459.67).round();
  }




}