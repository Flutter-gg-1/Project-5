import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../widgets/custom_text/custom_text.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.text_increase_outlined,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 266,
              width: 470,
              child: Image.asset(
                "assets/job_large.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.pivot_table_chart_outlined,
                        color: Color(0xffBDA6F5),
                      ),
                      Text(
                        "Technology",
                        style:
                            TextStyle(color: Color(0xffBDA6F5), fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomText( text: 
                    "How Gen Z are disrupting the definition of ‘prestigious’ jobs",
                        color: Colors.white,
                        size: 20,
                        fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 8,
                  ),
                  Image.asset(
                    "assets/Vector-6.png",
                    width: 28,
                    height: 28,
                  ),
                  const CustomText(text: "Amber Israelsen",
                          color: Color(0xffB8B8B8),
                          fontWeight: FontWeight.bold,
                          size: 14),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(text:  "2 min read • Jul 13, 2023",
                          color: Colors.white,
                          size: 12,
                          fontWeight: FontWeight.w500),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      Icon(
                        BoxIcons.bxl_facebook,
                        color: Color(0xffCFCFCF),
                      ),
                      Icon(BoxIcons.bxl_twitter, color: Color(0xffCFCFCF)),
                       Icon(BoxIcons.bx_link, color: Color(0xffCFCFCF)),
                    ],
                  ),
                  const SizedBox(
                    height: 79,
                  ),
                  const CustomText(text:  "Summary",
                          color: Colors.white,
                          size: 16,
                          fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(text: 
                      "Generation Z is redefining what it means to hold a ‘prestigious’ job, shifting away from traditional markers of success such as high salaries and well-known corporate roles. Instead, they value jobs that offer flexibility, personal fulfillment, and alignment with their values. This shift reflects broader changes in societal attitudes towards work and success. ",
                      color: Color(0xffB8B8B8),
                      size: 14,
                      fontWeight: FontWeight.w500),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText( text: 
                    "Content",
                        color: Colors.white,
                        size: 16,
                        fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomText(text: 
                      "Generation Z is challenging conventional notions of prestigious careers by prioritizing job attributes that align with their values and lifestyles. Unlike previous generations, who often equated prestige with high-paying positions at established companies or prestigious institutions, Gen Z is placing greater emphasis on flexibility, work-life balance, and opportunities for personal and professional growth. They are increasingly drawn to roles that offer creative freedom, social impact, and alignment with their personal values, such as environmental sustainability or social justice. This shift is prompting companies and industries to rethink their definitions of success and prestige, as traditional markers of status give way to new standards set by this emerging workforce. Gen Z’s preferences are reshaping the job market, driving changes in how both employers and employees view and value different types of work.”",
                      color: Color(0xffB8B8B8),
                      size: 14,
                      fontWeight: FontWeight.w500)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}