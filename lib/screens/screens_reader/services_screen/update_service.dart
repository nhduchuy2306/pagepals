import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pagepals/models/google_book.dart';
import 'package:pagepals/screens/screens_reader/services_screen/create_widgets/search_book_screen.dart';
import 'package:pagepals/screens/screens_reader/services_screen/create_widgets/service_type_dropdown.dart';
import 'package:pagepals/screens/screens_reader/services_screen/create_widgets/text_form.dart';
import 'package:pagepals/screens/screens_reader/services_screen/my_service_screen.dart';
import 'package:pagepals/services/service_service.dart';
import 'package:quickalert/quickalert.dart';

class UpdateServiceScreen extends StatefulWidget {
  final String serviceId;
  final String bookTitle;
  final String serviceType;
  final String serviceName;
  final String price;
  final String readerId;

  const UpdateServiceScreen(
      {super.key,
      required this.readerId,
      required this.bookTitle,
      required this.serviceType,
      required this.serviceName,
      required this.price,
      required this.serviceId});

  @override
  State<UpdateServiceScreen> createState() => _CreateServiceState();
}

class _CreateServiceState extends State<UpdateServiceScreen> {
  String? selectedServiceType;

  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController bookController = TextEditingController();

  @override
  initState() {
    super.initState();
    bookController.text = widget.bookTitle;
    selectedServiceType = widget.serviceType;
    serviceNameController.text = widget.serviceName;
    priceController.text = widget.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    print('serviceId: ${widget.serviceId}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Service'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).push(
              PageTransition(
                type: PageTransitionType.leftToRight,
                child: MyServiceScreen(
                  readerId: widget.readerId,
                ),
                duration: const Duration(milliseconds: 300),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: ScrollController(),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                label: 'Book',
                controller: bookController,
                readOnly: true,
              ),

              const SizedBox(height: 20),
              ServiceTypeDropdown(
                onChanged: (value) {
                  setState(() {
                    selectedServiceType = value;
                  });
                },
                value: selectedServiceType,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                  controller: serviceNameController, label: 'Service Name'),
              // const SizedBox(height: 20),
              // CustomTextFormField(
              //     controller: descriptionController, label: 'Description'),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: priceController,
                label: 'Price',
                isDigit: true,
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                label: 'Duration',
                initValue: '60 minutes',
                readOnly: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // show loading
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.greenAccent,
                          size: 60,
                        ),
                      );
                    },
                  );

                  double price = double.tryParse(priceController.text) ?? 00.00;
                  String description = serviceNameController.text;

                  bool updated = await ServiceService.updateService(
                      widget.serviceId,
                      selectedServiceType!,
                      description,
                      price);
                  if (updated) {
                    Future.delayed(const Duration(milliseconds: 100), () {
                      Navigator.pop(context);
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        title: 'Service Updated',
                        text: 'Service has been updated successfully',
                      );
                    });
                  } else {
                    Future.delayed(const Duration(milliseconds: 100), () {
                      Navigator.pop(context);
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        title: 'Update Failed',
                        text: 'Failed to update service. Please try again.',
                      );
                    });
                  }
                },
                child: const Text('Update Service'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
