import 'dart:ffi';
 
enum Currency{USD, RIEL}

class AmountException implements Exception {
  String errorMessage() {
    return "Balance amount is insufficient for withdrawing!";
  }
}

class IDException implements Exception {
  String errorMessage() {
    return "ID is already existed within the bank";
  }
}

class BankAccount {
  // TODO
  double _amount;
  final int? _id;
  final String? _accountHolderName;
  final Currency? _currency;
  BankAccount([this._id, this._accountHolderName, this._currency]): this._amount = 0;
  
  @override
  String toString() {
    String result = "\n\t\tAccount Name: $_accountHolderName\n\t\tID: $_id\n\t\tAmount: $_amount \$\n\t\t"; 
    if (_currency != null) {
      result += "Currency: ${_currency.name}";
    }
    return result;
  }


  String balance() => "Balance: ${this._amount}";

  void withdraw(double amount){
    try {
      if (amount < this._amount) {
        this._amount -= amount; 
        print("Withdrawing Successfully!");
      }
      else {
        throw new AmountException().errorMessage();
      }
    } catch (e) {
      print(e);
    }
  }
  BankAccount credit(double amount) {
    this._amount += amount;
    return this;
  }


  get amount => _amount;
  get id => _id;
  get accountHolderName => _accountHolderName;
  get currency => _currency;


}

class Bank {
  // TODO
  final String _name;
  final List<BankAccount> _accountList = [];

  Bank({required String name}): this._name = name;

  void addAccount(BankAccount newAccount) {
    this._accountList.add(newAccount);
  }
  
  @override
  String toString() {
    String result = "Bank: $_name\nAccount List: ${this._accountList.length}";
    for (var i = 0; i < this._accountList.length; i++) {
      if (this._accountList[i]._id == null) {
        continue;
      }
      else {
        result += "\n\tAccount ${i+1}: ${this._accountList[i]}";
      }
    }
    return result;
  }

  BankAccount createAccount(int accountId, String accountName) {
    BankAccount account = BankAccount(null, null, null);
    if (this._accountList.length == 0) {
      account = BankAccount(accountId, accountName, Currency.USD);
      this.addAccount(account);
      return account;
    }
    else {
      for (var i = 0; i < this._accountList.length; i++) {
        try {
          if (accountId == this._accountList[i]._id) {
            throw new IDException().errorMessage();
          }
          else {
            account = BankAccount(accountId, accountName, Currency.USD);
            this.addAccount(account);
          }
        } catch (e) {
          print(e);
        }
      }
      return account;
    }
  }
  

  get name => _name;
  get accountList => _accountList;
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  // print(myBank);
  BankAccount ronanAccount = myBank.createAccount(100, "Ronan");
  print(ronanAccount);

  print(ronanAccount.balance()); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance()); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance()); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
  print(myBank);
}
