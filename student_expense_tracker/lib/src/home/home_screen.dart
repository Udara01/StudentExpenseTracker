import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/firestore_service.dart';
//import 'add_expense_screen.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  HomeScreen({super.key});

  void _logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TrackFy"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _firestoreService.getExpenses(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Center(child: Text("Error loading expenses"));
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          var expenses = snapshot.data!.docs;

          return ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              var expense = expenses[index];
              return ListTile(
                title: Text("\$${expense['amount']} - ${expense['category']}"),
                subtitle: Text(expense['description']),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _firestoreService.deleteExpense(expense.id),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpenseScreen()));
        },
      ),
    );
  }
}
