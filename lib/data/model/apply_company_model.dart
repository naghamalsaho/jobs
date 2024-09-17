


class JobApplication {
  final int? id, seeker_id;
  final String? opportunity_name, seeker_email ,cvPath, status,created_at, seeker_name;

  JobApplication({this.seeker_email, this.created_at,
      this.id, this.opportunity_name, this.seeker_id, this.cvPath, this.status, this.seeker_name});

  factory JobApplication.fromJson(Map<String, dynamic> json) {
    return JobApplication(
      id: json['id'],
      opportunity_name: json['opportunity_name'],
      seeker_id: json['seeker_id'],
      seeker_email: json['seeker_email'],
      cvPath: json['cv'],
      status: json['status'],
      created_at:json['created_at'],
      seeker_name : json['seeker_name']
    );
  }
}
