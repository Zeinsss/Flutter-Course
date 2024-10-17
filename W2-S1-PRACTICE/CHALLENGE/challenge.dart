enum Unit{centimeter, meter, kilometer}

// Assuming default distance is meter!
const double centimeter = meter * 100 ; // 1000
const double meter = 1;
const double kilometer = meter / 1000; // 0.001
class Distance{
  final double _distance;
  final Unit _type;
  Distance(this._distance): this._type = Unit.meter;

  Distance.cms(double distance)
    : this._distance = distance * centimeter,
      this._type = Unit.centimeter;

  Distance.meters(double distance)
    : this._distance = distance * meter,
      this._type = Unit.meter;

  Distance.kms(double distance)
    : this._distance = distance * kilometer,
      this._type = Unit.kilometer;

  Distance kms() {
    return switch (this._type) {
      Unit.centimeter => Distance.kms(this._distance * kilometer),
      Unit.meter => Distance.kms(this._distance),
      Unit.kilometer => Distance.kms(this._distance / kilometer)
    };
  }
  Distance meters() {
    return switch (this._type) {
      Unit.centimeter => Distance.meters(this._distance * kilometer),
      Unit.meter => Distance.meters(this._distance),
      Unit.kilometer => Distance.meters(this._distance * centimeter * 10)
    };
  }

  Distance cms() {
    return switch (this._type) {
      Unit.centimeter => Distance.cms(this._distance * centimeter),
      Unit.meter => Distance.cms(this._distance),
      Unit.kilometer => Distance.cms(this._distance * kilometer)
    };
  }

  @override
  String toString() {
    return switch (this._type){
      Unit.centimeter => "Distance: $_distance cm",
      Unit.meter => "Distance: $_distance m",
      Unit.kilometer => "Distance: $_distance km",
    };
  }
  get distance => _distance;
  get type => _type;

  Distance operator +(covariant Distance p) {
    return Distance(
      this.meters()._distance + p.meters()._distance
    );
  }
}
main() {
  Distance dist1 = Distance.meters(1000);
  Distance dist2 = Distance.kms(1000);
  print(dist1);
  print(dist2); 
  Distance dist3 = (dist1+dist2); 
  print(dist3);
  print(dist3.kms());
  print(dist3.meters());
  print(dist3.cms());
}