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
  ServiceData getServiceData(int index) {
    return _services[index];
  }

  int getListSize() {
    return _services.length;
  }

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
      "https://kinetix-ai.com",
      true,
      true,
      false,
      true,
    ),
    ServiceData(
      "SailViewer",
      "https://ib-sailing.com/sailviewer-app/",
      false,
      true,
      true,
      true,
    ),
    ServiceData(
      "Telemetry Overlay",
      "https://goprotelemetryextractor.com/",
      false,
      true,
      true,
      true,
    ),
    ServiceData(
      "GPX See",
      "https://www.gpxsee.org/",
      false,
      true,
      true,
      false,
    ),
    ServiceData(
      "Expedition",
      "https://www.expeditionmarine.com/",
      false,
      true,
      false,
      true,
    ),
    ServiceData(
      "GPS Action Replay Pro",
      "http://gpsactionreplay.free.fr/",
      false,
      true,
      false,
      true,
    ),
    ServiceData(
      "Microsoft Excel",
      "https://www.microsoft.com/en-us/microsoft-365/excel",
      false,
      false,
      true,
      true,
    ),
    ServiceData(
      "Navionics",
      "https://www.navionics.com/usa/",
      false,
      true,
      false,
      true,
    ),
    ServiceData(
      "ReXY Gold",
      "https://www.rexygold.com/",
      false,
      true,
      false,
      true,
    ),
    ServiceData(
      "Tableau",
      "https://www.tableau.com/",
      false,
      false,
      true,
      true,
    ),
    ServiceData(
      "Google Maps",
      "https://www.google.com/maps",
      false,
      true,
      false,
      false,
    ),
    ServiceData(
      "Google Earth",
      "https://www.google.com/earth/index.html",
      false,
      true,
      false,
      false,
    ),
    ServiceData(
      "Google Sheets",
      "https://www.google.com/sheets/about/",
      false,
      false,
      true,
      false,
    ),
    ServiceData(
      "GPS Action Replay Classic",
      "http://gpsactionreplay.free.fr/",
      false,
      true,
      false,
      false,
    ),
    ServiceData(
      "GPX Studio",
      "https://gpx.studio/",
      false,
      true,
      false,
      false,
    ),
    ServiceData(
      "GPX Visualizer",
      "https://www.gpsvisualizer.com/",
      false,
      true,
      false,
      false,
    ),
    ServiceData(
      "Strava",
      "https://www.strava.com/",
      false,
      true,
      false,
      false,
    ),
  ];
}
