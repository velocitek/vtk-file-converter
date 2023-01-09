class ServiceData {
  ServiceData(
    this.serviceText,
    this.serviceLink,
    this.vtk,
    this.gpx,
    this.csv,
    this.paidService,
  );
  final String serviceText;
  final String serviceLink;
  final bool vtk;
  final bool gpx;
  final bool csv;
  final bool paidService;
}

class ServiceList {
  final List<ServiceData> _services = [
    ServiceData(
      "ChartedSails",
      "https://www.chartedsails.com/",
      true,
      true,
      true,
      true,
    ),
    ServiceData(
      "Sail Njord",
      "https://www.sailnjord.com/",
      true,
      true,
      true,
      true,
    ),
    ServiceData(
      "KINETIX.AI",
      "https://kinetix-ai.com/",
      true,
      true,
      false,
      true,
    ),
  ];
}
