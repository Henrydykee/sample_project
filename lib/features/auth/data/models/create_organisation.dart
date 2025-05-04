class CreateOrganizationParams {
  final String orgName;
  final String orgWebsite;
  final String countryOperation;
  final String businessType;
  final String businessIncorporate;
  final String businessGoal;
  final String size;
  final String registered;
  final String revenue;
  final String industry;
  final String demographic;
  final int grantFunding;
  final int debtFunding;
  final int equityFunding;
  final String payroll;
  final String research;

  CreateOrganizationParams({
    required this.orgName,
    required this.orgWebsite,
    required this.countryOperation,
    required this.businessType,
    required this.businessIncorporate,
    required this.businessGoal,
    required this.size,
    required this.registered,
    required this.revenue,
    required this.industry,
    required this.demographic,
    required this.grantFunding,
    required this.debtFunding,
    required this.equityFunding,
    required this.payroll,
    required this.research,
  });


}
