package com.myslanty.models;

import javax.json.bind.annotation.JsonbProperty;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * USED ONLY FOR TESTING
 * NOT INCLUDED IN THE ACTUAL PROJECT
 * FOR REFERENCE
 */


public class Person {
    public String name, surname;
    public int age;
    public Person() {

    }
    public Person(String name, String surname, int age) {
        this.name = name;
        this.surname = surname;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
