import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_app/database/database_helper.dart'; 
import 'package:pos_app/models/transaction_model.dart'; 
import 'dart:async';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  bool _isLoading = true;

  List<Transaction> _transactionsList = []; 

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _startDate = DateTime(now.year, now.month, now.day);
    _endDate = DateTime(now.year, now.month, now.day);
    _loadReport(_startDate, _endDate); 
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date); 
  }

  String get _dateRangeText {
    final start = _formatDate(_startDate);
    final end = _formatDate(_endDate);
    return start == end ? 'Riwayat Tanggal: $start' : 'Riwayat Rentang: $start - $end'; 
  }
  
  Future<void> _loadReport(DateTime start, DateTime end) async {
    setState(() {
      _isLoading = true;
    });

    final startOfDay = DateTime(start.year, start.month, start.day);
    final endOfRange = DateTime(end.year, end.month, end.day)
        .add(const Duration(days: 1))
        .subtract(const Duration(milliseconds: 1));
        
    final transactions = await DatabaseHelper.instance.getTransactionsByDateRange(
      startOfDay, 
      endOfRange,
    );
    
    setState(() {
      _startDate = start;
      _endDate = end;
      _transactionsList = transactions;
      _isLoading = false;
    });
  }

  void _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context, 
      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
      firstDate: DateTime(2023), 
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      final normalizedStart = DateTime(picked.start.year, picked.start.month, picked.start.day);
      final normalizedEnd = DateTime(picked.end.year, picked.end.month, picked.end.day);
      
      _loadReport(normalizedStart, normalizedEnd); 
    }
  }
  
  String _formatRupiah(int amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _selectDateRange, 
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _dateRangeText, 
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(height: 1),
                
                Expanded(
                  child: _transactionsList.isEmpty
                      ? const Center(child: Text('Tidak ada transaksi dalam rentang ini.'))
                      : ListView.builder(
                          itemCount: _transactionsList.length,
                          itemBuilder: (context, index) {
                            final transaction = _transactionsList[index];
                            return Card(
                              elevation: 1,
                              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                  child: Text((index + 1).toString(), style: const TextStyle(color: Colors.white)),
                                ),
                                title: Text(
                                  'ID Transaksi: ${transaction.transactionDate}', 
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  'Waktu: ${DateFormat('dd MMM yyyy HH:mm').format(transaction.transactionDate)}',
                                ),
                                trailing: Text(
                                  _formatRupiah(transaction.totalAmount),
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green.shade700),
                                ), 
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}