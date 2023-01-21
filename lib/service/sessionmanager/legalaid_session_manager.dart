
import 'dart:collection';

class SessionManager{

  static final Map<String,Object> _session = HashMap();

  static T getData<T>(String key,T defaultParam){
    if(_session[key] == null){
      return defaultParam;
    }
    return _session[key] as T;
  }

  static void putData(String key,Object data){
    _session[key] = data;
  }
}