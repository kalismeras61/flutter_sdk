import 'dart:convert';

class Command {
  String _className;
  String _methodName;
  String _jsonParameters;
  Map<String, dynamic> _parameters;

  Command(dynamic map) {
   try {
      _className = map['className'];
      _methodName = map['methodName'];
      _jsonParameters = map['jsonParameters'];
      _parameters = json.decode(_jsonParameters);
    } catch (e) {
      print('Error! Failed to map Command from incoming data. Details: ' +
          e.toString());
    }
  }

  String get className => _className;
  String get methodName => _methodName;

  String getFirstParameterValue(String parameterKey) {
    List<dynamic> parameterValues = _parameters[parameterKey];
    if (parameterValues == null || parameterValues.length == 0) {
      return null;
    }
    return parameterValues.first;
  }

  List<dynamic> getParamteters(String parameterKey) {
    return _parameters[parameterKey];
  }

  bool containsParameter(String parameterKey) {
    return _parameters[parameterKey] != null;
  }

  @override
  String toString() {
    return "Command[ className: $_className, methodName: $_methodName, jsonParameters: $_jsonParameters]";
  }
}
