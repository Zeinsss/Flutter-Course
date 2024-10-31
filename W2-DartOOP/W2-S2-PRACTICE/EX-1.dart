import 'dart:ffi';

enum Skill { FLUTTER(5000), DART(3000), OTHER(1000  );
  final double value;
  const Skill(this.value);
}

const double salaryPerYearOfExperience = 2000;


class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  @override
  String toString() {
    return "Street: $_street, City: $_city, Zip Code: $_zipCode";
  }
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  String get name => _name ;
  double get baseSalary => _baseSalary ;
  Address get address => _address ;
  List<Skill> get skills => _skills;
  int get yearsOfExperience => _yearsOfExperience ;

  Employee(this._name, this._baseSalary, this._address, this._yearsOfExperience): _skills = [];

  Employee.mobileDeveloper(String name, Address address, int years)
    : this._name = name, 
      this._address = address, 
      this._yearsOfExperience = years,
      this._skills = [Skill.DART, Skill.FLUTTER],
      this._baseSalary = 5000;
  double computeSalary() {
    double result = this._baseSalary;
    result += _yearsOfExperience * salaryPerYearOfExperience;
    for (var i = 0; i < _skills.length; i++) {
      result += _skills[i].value;
    }
    return result;
  }

  void addSkill(Skill newSkill) {
    this._skills.add(newSkill);
  }

  @override
  String toString() {
    String result ='Employee: $_name\nYears of experience: $_yearsOfExperience\nAddress: $_address\nSkills:';
    for (var i = 0; i < _skills.length; i++) {
      result += '\n\tSkill: ${_skills[i].name} = ${_skills[i].value}, ';
    } 
    result += '\nBase Salary: $_baseSalary';
    return result;
  }

}

class Salary{
  final Employee _employee;
  final _totalSalaryPerYear;


  Salary(this._employee): _totalSalaryPerYear = _employee.computeSalary();

  

  @override
  String toString() {
    // TODO: implement toString
    return "${_employee}\n\tSalary Per Year Experience: $salaryPerYearOfExperience\n\tTotal Salary per Year: $_totalSalaryPerYear ";
  }
}

void main() {
  Address address = Address("Loy", "PP", "12000");
  var emp1 = Employee.mobileDeveloper('Sokea', address, 12);

  Salary salary = Salary(emp1);
  print(salary);

  // var emp2 = Employee('Ronan', 45000);
  // emp2.printDetails();
}