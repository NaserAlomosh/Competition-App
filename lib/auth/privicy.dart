// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text("privicy policy",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),

      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text("ur policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You. We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Free Privacy Policy Generator"),
            Text("Interpretation and Definitions Interpretation The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in pluralDefinitions "),
            Text("Account means a unique account created for You to access our Service or parts of our Service.") ,
            Text("Affiliate means an entity that controls, is controlled by or is under common control with a party, where 'control' means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.") ,
            Text("Application refers to University Study Hub , the software program provided by the Company."),
            Text("Company (referred to as either 'the Company', 'We', 'Us' or 'Our' in thisAgreement) refers to University Study Hub"),
            Text("Country refers to: Jordan "),
            Text("Device means any device that can access the Service such as a computer, acellphone or a digital tablet."),
            Text("Personal Data is any information that relates to an identified or identifiableindividual"),
            Text("Service refers to the Application. "),
            //Text("Service Provider means any natural or legal person who processes the data onbehalf of the Company. It refers to third-party companies or individuals employedby the Company to facilitate the Service, to provide the Service on behalf of theCompany, to perform services related to the Service or to assist the Company inanalyzing how the Service is used"),
            
          ],
        ),
      ),
      
    );
  }
}