import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/basic.dart';
import 'package:portfolio_builder_ai/responsive/responsive_row_expanded.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';
import 'package:portfolio_builder_ai/widgets/form_wav.dart';
import 'package:portfolio_builder_ai/widgets/input_field.dart';
import 'package:portfolio_builder_ai/widgets/o_button.dart';

class BasicsForm extends StatelessWidget {
  final Basic basic;
  final ValueChanged<Basic> onChanged;
  const BasicsForm({
    super.key,
    required this.basic,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> autovalidateMode = ValueNotifier(AutovalidateMode.disabled);

    final TextEditingController nameController = TextEditingController(text: basic.name);
    final TextEditingController designationController = TextEditingController(text: basic.designation);
    final TextEditingController emailController = TextEditingController(text: basic.emailAddress);
    final TextEditingController phoneController = TextEditingController(text: basic.phoneNumber);
    final TextEditingController summaryController = TextEditingController(text: basic.summary);

    final TextEditingController addressController = TextEditingController(text: basic.location?.address);
    final TextEditingController postalController = TextEditingController(text: basic.location?.postalCode);
    final TextEditingController cityController = TextEditingController(text: basic.location?.city);
    final TextEditingController stateController = TextEditingController(text: basic.location?.state);
    final TextEditingController countryCodeController = TextEditingController(text: basic.location?.countryCode);
    final TextEditingController regionController = TextEditingController(text: basic.location?.country);


    return Column(
      children: [
        Expanded(
          child: FormWAV(
            autovalidateMode: autovalidateMode,
            formKey: formKey,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [

                'Personal Details :'.bodySmall(context),
                16.height(),
                
                InputField(
                  labelText: 'Name',
                  defaultMargin: true,
                  controller: nameController
                ),
                InputField(
                  labelText: 'Designation',
                  defaultMargin: true,
                  controller: designationController
                ),
                ResponsiveRowExpanded(
                  addGap: true,
                  children: [
                    InputField(
                      labelText: 'Email address',
                      defaultMargin: true,
                      controller: emailController
                    ),
                    12.width(),
                    InputField(
                      labelText: 'Phone number',
                      defaultMargin: true,
                      controller: phoneController
                    )
                  ],
                ),
                InputField(
                  labelText: 'Summary',
                  defaultMargin: true,
                  maxLines: 6,
                  controller: summaryController
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: 'Location Details :'.bodySmall(context),  
                ),
                InputField(
                  labelText: 'Address',
                  defaultMargin: true,
                  maxLines: 6,
                  controller: addressController
                ),
                ResponsiveRowExpanded(
                  addGap: true,
                  children: [
                    InputField(
                      labelText: 'City',
                      defaultMargin: true,
                      controller: cityController
                    ),
                    12.width(),
                    InputField(
                      labelText: 'State',
                      defaultMargin: true,
                      controller: stateController
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: InputField(
                        labelText: 'CCode',
                        defaultMargin: true,
                        controller: countryCodeController
                      ),
                    ),
                    12.width(),
                    Expanded(
                      flex: 7,
                      child: InputField(
                        labelText: 'Region',
                        defaultMargin: true,
                        controller: regionController
                      ),
                    )
                  ],
                ),
                InputField(
                  labelText: 'Postal Code',
                  defaultMargin: true,
                  controller: postalController
                ),
        
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 220,
                child: OButton(
                  onClick: (){},
                  text: 'Cancel'),
              ),
              SizedBox(
                width: 220,
                child: EButton(
                  onClick: (){
                    var updated = basic.copyWith(
                      name: nameController.trim(),
                      designation: designationController.trim(),
                      emailAddress: emailController.trim(),
                      phoneNumber: phoneController.trim(),
                      summary: summaryController.trim(),
                      location: basic.location?.copyWith(
                        address: addressController.trim(),
                        postalCode: postalController.trim(),
                        city: cityController.trim(),
                        state: stateController.trim(),
                        country: countryCodeController.trim(),
                        countryCode: countryCodeController.trim() 
                      )
                    );
                    onChanged(updated);
                  }, 
                  text: 'Save'),
              )
            ],
          ),
        )
      ],
    );
  }
}