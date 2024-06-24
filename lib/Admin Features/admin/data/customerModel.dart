List<double> customersPercentage = [80, 50, 20, 90];
List<String> customersPercentageV =
    customersPercentage.map((intItem) => intItem.toString()).toList();

class CurrentCustomer {
  String userName;
  String profilePic;
  String profileLink;

  CurrentCustomer(this.userName, this.profilePic, this.profileLink);
}

List<CurrentCustomer> CurrentCustomers = [
  CurrentCustomer('Nermeen Ibrahim', 'assets/Ellipse 7.png', ''),
  CurrentCustomer('Amira Shinnawi', 'assets/Ellipse 7.png', ''),
  CurrentCustomer('Esraa Rabia', 'assets/Ellipse 7.png', ''),
  CurrentCustomer('Sohaila Akram', 'assets/Ellipse 7.png', ''),
  CurrentCustomer('Nadia Zalat', 'assets/Ellipse 7.png', '')
];

class DashBoardFirstContainers {
  String text;
  String number;
  String details;

  DashBoardFirstContainers(this.text, this.number, this.details);
}

List<DashBoardFirstContainers> DashBoardFirstContainersList = [
  DashBoardFirstContainers('Todays sals', '\$20.4k', 'we have sold 123 items'),
  DashBoardFirstContainers('Todays revenue', '\$8.2k', 'Available to payout'),
  DashBoardFirstContainers('Total orders', '\$1300k', 'Available to..')
];

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

late List<SalesData> data = [
  SalesData('Jan', 12),
  SalesData('Feb', 15),
  SalesData('Mar', 30),
  SalesData('Apr', 6.4),
  SalesData('May', 14)
];
late List<SalesData> data2 = <SalesData>[
  SalesData(
    'Jan',
    6,
  ),
  SalesData(
    'Feb',
    7,
  ),
  SalesData(
    'Mar',
    5,
  ),
  SalesData(
    'Apr',
    6,
  ),
  SalesData(
    'May',
    8,
  ),
];

class mostSoldItem {
  String plantName;
  int value;

  mostSoldItem(this.plantName, this.value);
}

List<mostSoldItem> mostSoldItems = [
  mostSoldItem('plant name', 70),
  mostSoldItem('plant name', 20),
  mostSoldItem('plant name', 70),
  mostSoldItem('plant name', 40),
  mostSoldItem('plant name', 70)
];
