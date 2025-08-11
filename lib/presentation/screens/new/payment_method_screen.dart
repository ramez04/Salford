
import 'package:clean_archi/presentation/controller/new/payment_method_controller.dart';
import 'package:clean_archi/presentation/widgets/button.dart';
import 'package:clean_archi/presentation/widgets/custom_field.dart';
import 'package:clean_archi/presentation/widgets/top_bar.dart';
import 'package:clean_archi/util/app_colors.dart';
import 'package:clean_archi/util/app_general.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(
      builder: (con) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: SizedBox(
              width: AppGeneral.width,
              height: AppGeneral.height,

              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 10),
                        TopBar(title: "Payment Method"),

                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              spacing: 16,
                              children: [
                                Row(),
                                const Text(
                                  'Add Payment Method',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'Provide Your Payment Method Details Below',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),

                                CustomField(
                                  preffix: Icon(Icons.credit_card),
                                  hint: 'Enter Card Number',
                                  controller: con.cardNumber,
                                  maxLength: 20,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    MaskTextInputFormatter(
                                      mask: '####-####-####-####',
                                      filter: {"#": RegExp(r'[0-9]')},
                                    ),
                                  ],
                                ),
                                CustomField(
                                  preffix: Icon(Icons.person),
                                  hint: 'Enter Card Holder Name',
                                  controller: con.cardHolderName,
                                ),
                                Obx(() {
                                  return CustomField(
                                    hint: "Expiry Date",
                                    preffix: Icon(Icons.calendar_today),
                                    controller: con.expiryDate.value,
                                    keyboardType: TextInputType.number,
                                    maxLength: 5,
                                    inputFormatters: [
                                      MaskTextInputFormatter(
                                        mask: '##/##',
                                        filter: {"#": RegExp(r'[0-9]')},
                                      ),
                                    ],
                                  );
                                }),
                                CustomField(
                                  maxLength: 3,
                                  preffix: Icon(Icons.lock),
                                  hint: 'Enter CVV',
                                  controller: con.cvv,
                                  keyboardType: TextInputType.number,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: GestureDetector(
                        onTap: () {
                          con.addPaymentMethod();
                        },
                        child: Button(
                          text: "Prceed to payment",
                          width: AppGeneral.width!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
