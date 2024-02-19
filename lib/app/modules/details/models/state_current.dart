class StateCurrentModel {
  int? date;
  String? state;
  int? positive;
  String? totalTestResultsSource;
  int? totalTestResults;
  int? hospitalizedCurrently;
  int? hospitalizedCumulative;
  int? onVentilatorCurrently;
  String? lastUpdateEt;
  String? dateModified;
  String? checkTimeEt;
  int? death;
  int? hospitalized;
  String? dateChecked;
  int? totalTestsViral;
  int? positiveTestsViral;
  int? negativeTestsViral;
  String? fips;
  int? positiveIncrease;
  int? negativeIncrease;
  int? total;
  int? totalTestResultsIncrease;
  int? posNeg;
  int? deathIncrease;
  int? hospitalizedIncrease;
  String? hash;
  int? commercialScore;
  int? negativeRegularScore;
  int? negativeScore;
  int? positiveScore;
  int? score;
  String? grade;

  StateCurrentModel(
      {this.date,
      this.state,
      this.positive,
      this.totalTestResultsSource,
      this.totalTestResults,
      this.hospitalizedCurrently,
      this.hospitalizedCumulative,
      this.onVentilatorCurrently,
      this.lastUpdateEt,
      this.dateModified,
      this.checkTimeEt,
      this.death,
      this.hospitalized,
      this.dateChecked,
      this.totalTestsViral,
      this.positiveTestsViral,
      this.negativeTestsViral,
      this.fips,
      this.positiveIncrease,
      this.negativeIncrease,
      this.total,
      this.totalTestResultsIncrease,
      this.posNeg,
      this.deathIncrease,
      this.hospitalizedIncrease,
      this.hash,
      this.commercialScore,
      this.negativeRegularScore,
      this.negativeScore,
      this.positiveScore,
      this.score,
      this.grade});

  StateCurrentModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    state = json['state'];
    positive = json['positive'];
    totalTestResultsSource = json['totalTestResultsSource'];
    totalTestResults = json['totalTestResults'];
    hospitalizedCurrently = json['hospitalizedCurrently'];
    hospitalizedCumulative = json['hospitalizedCumulative'];
    onVentilatorCurrently = json['onVentilatorCurrently'];
    lastUpdateEt = json['lastUpdateEt'];
    dateModified = json['dateModified'];
    checkTimeEt = json['checkTimeEt'];
    death = json['death'];
    hospitalized = json['hospitalized'];
    dateChecked = json['dateChecked'];
    totalTestsViral = json['totalTestsViral'];
    positiveTestsViral = json['positiveTestsViral'];
    negativeTestsViral = json['negativeTestsViral'];
    fips = json['fips'];
    positiveIncrease = json['positiveIncrease'];
    negativeIncrease = json['negativeIncrease'];
    total = json['total'];
    totalTestResultsIncrease = json['totalTestResultsIncrease'];
    posNeg = json['posNeg'];
    deathIncrease = json['deathIncrease'];
    hospitalizedIncrease = json['hospitalizedIncrease'];
    hash = json['hash'];
    commercialScore = json['commercialScore'];
    negativeRegularScore = json['negativeRegularScore'];
    negativeScore = json['negativeScore'];
    positiveScore = json['positiveScore'];
    score = json['score'];
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['date'] = date;
    data['state'] = state;
    data['positive'] = positive;
    data['totalTestResultsSource'] = totalTestResultsSource;
    data['totalTestResults'] = totalTestResults;
    data['hospitalizedCurrently'] = hospitalizedCurrently;
    data['hospitalizedCumulative'] = hospitalizedCumulative;
    data['onVentilatorCurrently'] = onVentilatorCurrently;
    data['lastUpdateEt'] = lastUpdateEt;
    data['dateModified'] = dateModified;
    data['checkTimeEt'] = checkTimeEt;
    data['death'] = death;
    data['hospitalized'] = hospitalized;
    data['dateChecked'] = dateChecked;
    data['totalTestsViral'] = totalTestsViral;
    data['positiveTestsViral'] = positiveTestsViral;
    data['negativeTestsViral'] = negativeTestsViral;
    data['fips'] = fips;
    data['positiveIncrease'] = positiveIncrease;
    data['negativeIncrease'] = negativeIncrease;
    data['total'] = total;
    data['totalTestResultsIncrease'] = totalTestResultsIncrease;
    data['posNeg'] = posNeg;
    data['deathIncrease'] = deathIncrease;
    data['hospitalizedIncrease'] = hospitalizedIncrease;
    data['hash'] = hash;
    data['commercialScore'] = commercialScore;
    data['negativeRegularScore'] = negativeRegularScore;
    data['negativeScore'] = negativeScore;
    data['positiveScore'] = positiveScore;
    data['score'] = score;
    data['grade'] = grade;
    return data;
  }
}
