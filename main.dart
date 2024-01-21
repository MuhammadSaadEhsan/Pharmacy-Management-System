import 'dart:io';

class Pharmacy {
  List<String> customers = ["Sajid","Hammad","Saad","Ehsan","Zeeshan"];
  Map<String, List> medicine = {
    "Brofen": ["120", 3],
    "Panadol": ["7", 300],
    "Arinac": ["160", 33],
    "Calpol": ["320", 14],
  };
  String Admin = "";
  String password = "2904";

  Pharmacy(String name) {
    var helped = false;
    print("To login as admin please enter password");
    print("Hint: 2904  (only while testing)");
    String? password = stdin.readLineSync();
    print("");
    if (this.password == password) {
      Admin = name;
      print("Congratulation you have successfully logged in");
      print("Hello Sir How i can help you?");
      helpings();
    } else {
      print("Wrong password");
      exit(0);
    }
  }

  void addCustomer(String user) {
    customers.add(user);
    print("$user has been added successfully as a new customer");
    // helpings();
  }

  void viewCustomers() {
    if (customers.length == 0) {
      print("You don't have any customer :(");
    }
    print("Your total customers are :");
    for (int i = 0; i < customers.length; i++) {
      print("${i + 1}. ${customers[i]}");
    }
  }

  void removeCustomer(String user) {
    if(customers.contains(user)){
      customers.remove(user);
      print("$user has been deleted successfully");
    }else {
      print("$user is already not your pharmacy");
    }
  }

  void addMedicine(
    String medicine,
    String price,
    int quantity,
  ) {
    print("$quantity $medicine has been added successfully!");
    this.medicine[medicine] = [price, quantity];
  }

  viewMedicine() {
    print("medicine  price  Quantity");
    medicine.forEach((key, value) {
      print("$key  :   ${value[0]}  :  ${value[1]}");
    });
  }

  void removeMedicine(String medicine) {
    if (this.medicine.containsKey(medicine)) {
      print("$medicine has been removed from your pharmacy");
      this.medicine.removeWhere((key, value) => key == medicine);
      viewMedicine();
    } else {
      print("$medicine is already not your customer");
    }
  }

  void updateMedicine(String medicine) {
    if (this.medicine.containsKey(medicine)) {
      print("Enter the new price of $medicine");
      String? newPrice = stdin.readLineSync();
      print("Enter the new quantity of $medicine");
      int? newQuantity = int.parse(stdin.readLineSync()!);
      this.medicine[medicine] = [newPrice, newQuantity];
      viewMedicine();
    } else {
      print("$medicine is not in your pharmacy");
    }
  }

  void sellMedicine(String medicine, int quantity) {
    if (this.medicine[medicine]![1] < quantity) {
      print(
          "Medicine is not available right now, please wait sometime for new stock");
    } else {
      print("$quantity $medicine has been sold successfully!");
      int? oldQuantity = this.medicine[medicine]![1];
      this.medicine[medicine]![1] = oldQuantity! - quantity;
      paymentReciept(medicine, quantity);
    }
  }

  void paymentReciept(medicine, quantity) {
    String sprice = this.medicine[medicine]![0];
    int price = int.parse(sprice);
    print("---------------------------------------");
    print("---------------------------------------");
    print("--                                     ");
    print("--             Your Bill               ");
    print("--                                     ");
    print("--       medicine : $medicine          ");
    print("--       price    : $price             ");
    print("--       quantity : $quantity          ");
    print("--                                     ");
    print("--       ---------------------         ");
    print("--       Total    : ${price * quantity}");
    print("--                                     ");
    print("---------------------------------------");
    print("---------------------------------------");
  }

  helpings() {
    print("Give me any number from below list");
    print("");
    print("##########################################");
    print("#                                        #");
    print("#    1.  Add new Customer                #");
    print("#    2.  View your all Customers         #");
    print("#    3.  Delete any Customers            #");
    print("#    4.  Add new Medicine                #");
    print("#    5.  View your all medicines         #");
    print("#    6.  Delete any medicine             #");
    print("#    7.  Update any medicine             #");
    print("#    8.  Sell any medicine               #");
    print("#    9.  Change Admin Password           #");
    print("#    10. Logout                          #");
    print("#                                        #");
    print("##########################################\n");
    String? help = stdin.readLineSync();
    print("");

    if (help == "10") {
      print("Good bye!");
      exit(0);
    } else if (help == "1") {
      print("Enter the name of your new customer");
      String? name = stdin.readLineSync();
      addCustomer("$name");
      doContinue();
    } else if (help == "2") {
      viewCustomers();
      doContinue();
    } else if (help == "3") {
      print("Enter the name of your new customer");
      String? name = stdin.readLineSync();
      removeCustomer("$name");
      doContinue();
    } else if (help == "4") {
      print("Enter the name of your new medicine");
      String? medicine = stdin.readLineSync();
      print("Enter the price of your new medicine");
      String? price = stdin.readLineSync();
      print("Enter the quantity of your new medicine");
      int? quantity = int.parse(stdin.readLineSync()!);
      addMedicine(medicine!, price!, quantity);
      doContinue();
    } else if (help == '5') {
      viewMedicine();
      doContinue();
    } else if (help == '6') {
      print("Enter the name of medicine you want to delete: ");
      String? delMedicine = stdin.readLineSync();
      removeMedicine(delMedicine!);
      doContinue();
    } else if (help == "7") {
      print("Enter the name of medicine you want to update: ");
      String? updateMedicine = stdin.readLineSync();
      this.updateMedicine(updateMedicine!);
      doContinue();
    } else if (help == "8") {
      print("Enter the name of medicine :");
      String? name = stdin.readLineSync();
      print("Enter the quantity for sale :");
      int? quantity = int.parse(stdin.readLineSync()!);
      sellMedicine(name!, quantity);
      doContinue();
    } else if (help == "9") {
      print("Enter your new password :");
      String? pass = stdin.readLineSync();
      password = pass!;
      doContinue();
    } else if (help == "10") {
      print("Thanks for using me");
      print("Good bye!");
      exit(0);
    } else {
      print("Number between 1 to 10 was expected");
      doContinue();
    }
  }

  void doContinue() {
    print("\nDo you want to continue?\n-Yes (y)\n-No  (n)\n");
    var reply = stdin.readLineSync();
    print("");
    if (reply == 'y') {
      helpings();
    } else {
      print("Good bye");
      exit(0);
    }
  }
}

void main() {
  Pharmacy saad = new Pharmacy("Saad");
}
