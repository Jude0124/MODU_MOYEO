package com.Modoomoyeo.momo.user;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class PWAuthentication extends Authenticator{

    PasswordAuthentication pa;

    public PWAuthentication(String mailId, String mailPass) {
        pa = new PasswordAuthentication(mailId, mailPass);
    }

    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}