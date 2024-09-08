
import 'package:flutter/material.dart';
import "package:flutter_zxing/flutter_zxing.dart";

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;

  // List of widget pages to navigate between
  final List<Widget> _pages = [
    HomeScreen(),
   TransactionsScreen(),
    SettingsScreen(),
  ];

  // Function to handle bottom navigation tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 20.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add back navigation functionality if needed
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(width: 10),
            const Text(
              "Home",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu actions
              switch (value) {
                case 'Profile':
                // Navigate to Profile
                  break;
                case 'Settings':
                  _selectedIndex=2;
                  _onItemTapped(2);
                // Navigate to Settings
                  break;
                case 'Logout':
               Navigator.pushNamed(context, "login");
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Profile', 'Settings', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20.0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Transactions"),
          BottomNavigationBarItem(icon: Icon(Icons.payment ), label: "Pay"),
        ],
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex, // Current selected index
        onTap: _onItemTapped, // Handle tap
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return const Column(
    children: [Center(child:Text("Payment Page"))],
  );
    throw UnimplementedError();
  }

}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dashboard Heading
          const Text(
            'Dashboard Summary',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black54
            ),
          ),
          const SizedBox(height: 20),

          // Balance Card
          Card(
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5.0,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              title: const Text(
                'Balance',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              trailing: const Text(
                '5.02 Tokens',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70
                ),
              ),
              leading: const Icon(
                Icons.token,
                color: Colors.white,
                size: 35,
              ),
              onTap: () {
                // Add balance tap functionality if needed
              },
            ),
          ),
          const SizedBox(height: 20),

          // Top Transactions Card
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Top Transactions",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(
                      Icons.token_outlined,
                      color: Colors.blueAccent,
                      size: 30,
                    ),
                    title: const Text(
                      'Transaction 1',
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      // Add transaction details functionality
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      // Add 'All Transactions' navigation
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        "View All Transactions",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Pay and Refill Buttons
          Card(
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Handle Pay action
                    },
                    icon: const Icon(
                      Icons.payment,
                      color: Colors.blueAccent,
                    ),
                    label: const Text(
                      "Pay",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Handle Refill action
                    },
                    icon: const Icon(
                      Icons.sync,
                      color: Colors.blueAccent,
                    ),
                    label: const Text(
                      "Refill",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class TransactionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        const Text(
          'Transaction History',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Card(
          child: ListTile(
            title: const Text('Transaction 1'),
            subtitle: const Text('ID: TX12345\nAmount: \$200.00\nDate: 2024-09-01\nStatus: Completed'),
            leading: const Icon(Icons.payment),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to transaction details
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('Transaction 2'),
            subtitle: const Text('ID: TX12346\nAmount: \$150.00\nDate: 2024-09-02\nStatus: Pending'),
            leading: const Icon(Icons.payment),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to transaction details
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('Transaction 3'),
            subtitle: const Text('ID: TX12347\nAmount: \$300.00\nDate: 2024-09-03\nStatus: Failed'),
            leading: const Icon(Icons.payment),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to transaction details
            },
          ),
        ),
        // Add more transactions as needed
      ],
    );
  }
}

// SettingsScreen with Settings Options
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        const Text(
          'Settings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Account'),
          subtitle: const Text('Manage your account settings'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Navigate to Account Settings
          },
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Notifications'),
          subtitle: const Text('Customize your notifications'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Navigate to Notifications Settings
          },
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Security'),
          subtitle: const Text('Update your security settings'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Navigate to Security Settings
          },
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('Help & Support'),
          subtitle: const Text('Get help and support'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Navigate to Help & Support
          },
        ),
      ],
    );
  }
}
