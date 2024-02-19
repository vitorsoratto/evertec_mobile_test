class CurrentModel {
  int? date;
  int? states;
  int? positive;
  int? negative;
  int? pending;
  int? hospitalizedCurrently;
  int? hospitalizedCumulative;
  int? inIcuCurrently;
  int? inIcuCumulative;
  int? onVentilatorCurrently;
  int? onVentilatorCumulative;
  String? dateChecked;
  int? death;
  int? hospitalized;
  int? totalTestResults;
  String? lastModified;
  int? recovered;
  int? total;
  int? posNeg;
  int? deathIncrease;
  int? hospitalizedIncrease;
  int? negativeIncrease;
  int? positiveIncrease;
  int? totalTestResultsIncrease;
  String? hash;

  CurrentModel(
      {this.date,
      this.states,
      this.positive,
      this.negative,
      this.pending,
      this.hospitalizedCurrently,
      this.hospitalizedCumulative,
      this.inIcuCurrently,
      this.inIcuCumulative,
      this.onVentilatorCurrently,
      this.onVentilatorCumulative,
      this.dateChecked,
      this.death,
      this.hospitalized,
      this.totalTestResults,
      this.lastModified,
      this.recovered,
      this.total,
      this.posNeg,
      this.deathIncrease,
      this.hospitalizedIncrease,
      this.negativeIncrease,
      this.positiveIncrease,
      this.totalTestResultsIncrease,
      this.hash});

  CurrentModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    states = json['states'];
    positive = json['positive'];
    negative = json['negative'];
    pending = json['pending'];
    hospitalizedCurrently = json['hospitalizedCurrently'];
    hospitalizedCumulative = json['hospitalizedCumulative'];
    inIcuCurrently = json['inIcuCurrently'];
    inIcuCumulative = json['inIcuCumulative'];
    onVentilatorCurrently = json['onVentilatorCurrently'];
    onVentilatorCumulative = json['onVentilatorCumulative'];
    dateChecked = json['dateChecked'];
    death = json['death'];
    hospitalized = json['hospitalized'];
    totalTestResults = json['totalTestResults'];
    lastModified = json['lastModified'];
    recovered = json['recovered'];
    total = json['total'];
    posNeg = json['posNeg'];
    deathIncrease = json['deathIncrease'];
    hospitalizedIncrease = json['hospitalizedIncrease'];
    negativeIncrease = json['negativeIncrease'];
    positiveIncrease = json['positiveIncrease'];
    totalTestResultsIncrease = json['totalTestResultsIncrease'];
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['date'] = date;
    data['states'] = states;
    data['positive'] = positive;
    data['negative'] = negative;
    data['pending'] = pending;
    data['hospitalizedCurrently'] = hospitalizedCurrently;
    data['hospitalizedCumulative'] = hospitalizedCumulative;
    data['inIcuCurrently'] = inIcuCurrently;
    data['inIcuCumulative'] = inIcuCumulative;
    data['onVentilatorCurrently'] = onVentilatorCurrently;
    data['onVentilatorCumulative'] = onVentilatorCumulative;
    data['dateChecked'] = dateChecked;
    data['death'] = death;
    data['hospitalized'] = hospitalized;
    data['totalTestResults'] = totalTestResults;
    data['lastModified'] = lastModified;
    data['recovered'] = recovered;
    data['total'] = total;
    data['posNeg'] = posNeg;
    data['deathIncrease'] = deathIncrease;
    data['hospitalizedIncrease'] = hospitalizedIncrease;
    data['negativeIncrease'] = negativeIncrease;
    data['positiveIncrease'] = positiveIncrease;
    data['totalTestResultsIncrease'] = totalTestResultsIncrease;
    data['hash'] = hash;
    return data;
  }
}
