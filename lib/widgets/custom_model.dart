import 'package:flutter/material.dart';

class CustomModal {
  showModal({
    required BuildContext context,
    required Widget child,
  }) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).iconTheme.color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    child,
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        });
  }
}