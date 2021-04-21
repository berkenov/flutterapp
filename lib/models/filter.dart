class Filter {
  double priceFrom, priceUntil, valueFrom, valueUntil;
  int type;
  Filter(
      {this.priceFrom,
      this.priceUntil,
      this.valueFrom,
      this.valueUntil,
      this.type});
  clear() {
    this.priceFrom = 0;
    this.priceUntil = 1000;
    this.type = 0;
    this.valueFrom = 0;
    this.valueUntil = 1000;
  }

  set({double pricefrom, priceuntil, valuefrom, valueuntil, int types}) {
    this.priceFrom = pricefrom;
    this.priceUntil = priceuntil;
    this.valueFrom = valuefrom;
    this.valueUntil = valueuntil;
    this.type = types;
  }
}
