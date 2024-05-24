class Timer{
  int time;
  int checkpointTime;
  
  Timer(){
    time = 0;
    checkpointTime = millis();
  }
  
  void updateTime(){
    int currentTime = millis();
    time += currentTime - checkpointTime;
    checkpointTime = currentTime;
  }
  
  void setTime(int t){
    time = t;
  }
  
  int getTime(int t){
    return time;
  }
}