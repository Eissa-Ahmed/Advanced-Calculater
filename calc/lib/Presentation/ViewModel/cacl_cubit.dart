import 'package:calc/Model/oldValueModel.dart';
import 'package:calc/Presentation/View/Widgets/buttom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:meta/meta.dart';

part 'cacl_state.dart';

class CaclCubit extends Cubit<CaclState> {
  CaclCubit() : super(CaclInitial());

  static CaclCubit get(context) => BlocProvider.of(context);

  //Varibales
  String inputUser = "";
  String answer = "0";
  String operator = "";

  //Lists
  List<Buttom> listItemButtom() => [
        Buttom.orange(item: "AC", onTap: () => clear()),
        Buttom.red(item: "DEL", onTap: () => delete()),
        Buttom.blue(item: "%", onTap: () => userAddValue("%")),
        Buttom.blue(item: "/", onTap: () => userAddValue("/")),
        Buttom(item: "7", onTap: () => userAddValue("7")),
        Buttom(item: "8", onTap: () => userAddValue("8")),
        Buttom(item: "9", onTap: () => userAddValue("9")),
        Buttom.blue(item: "*", onTap: () => userAddValue("*")),
        Buttom(item: "4", onTap: () => userAddValue("4")),
        Buttom(item: "5", onTap: () => userAddValue("5")),
        Buttom(item: "6", onTap: () => userAddValue("6")),
        Buttom.blue(item: "-", onTap: () => userAddValue("-")),
        Buttom(item: "1", onTap: () => userAddValue("1")),
        Buttom(item: "2", onTap: () => userAddValue("2")),
        Buttom(item: "3", onTap: () => userAddValue("3")),
        Buttom.blue(item: "+", onTap: () => userAddValue("+")),
        Buttom.blue(item: "±", onTap: () => userAddValue("±")),
        Buttom(item: "0", onTap: () => userAddValue("0")),
        Buttom.blue(item: ".", onTap: () => userAddValue(".")),
        Buttom.blue(item: "=", onTap: () => equal()),
      ];
  List<OldValueModel> oldValues = [];

  //Funcation
  void clear() {
    inputUser = "";
    answer = "0";
    emit(ClearState());
  }

  void delete() {
    inputUser = inputUser.substring(0, inputUser.length - 1);
    answer = "0";
    emit(DeleteState());
  }

  void userAddValue(String value) {
    if (answer != "0") {
      if (value == "+" || value == "-" || value == "/" || value == "*") {
        inputUser = answer;
        answer = "0";
      } else {
        oldValues.add(OldValueModel(inputUser: inputUser, value: answer));
        inputUser = "";
        answer = "0";
      }
    }
    inputUser += value;
    emit(InputUserState());
  }

  void equal() {
    if (inputUser != "") {
      try {
        ContextModel cm = ContextModel();
        Parser p = Parser();
        Expression exp = p.parse(inputUser);
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        answer = eval.toString();
        emit(InputUserState());
      } catch (e) {
        print("Error ?");
      }
    }
  }
}
