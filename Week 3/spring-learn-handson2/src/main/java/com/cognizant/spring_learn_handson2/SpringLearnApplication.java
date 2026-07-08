package com.cognizant.spring_learn_handson2;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SpringBootApplication
public class SpringLearnApplication {

    public static void main(String[] args) {

        System.out.println("MAIN STARTED");

        displayDate();

        SpringApplication.run(SpringLearnApplication.class, args);
    }

    public static void displayDate() {

        System.out.println("displayDate() called");

        try {

            ApplicationContext context =
                    new ClassPathXmlApplicationContext("date-format.xml");

            System.out.println("XML Loaded");

            SimpleDateFormat format =
                    context.getBean("dateFormat", SimpleDateFormat.class);

            Date date = format.parse("31/12/2018");

            System.out.println("Parsed Date : " + date);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}