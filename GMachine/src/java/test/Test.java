/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dao.IDao;
import entities.Machine;
import entities.Salle;
import java.rmi.RemoteException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Hibernate;
import services.MachineService;
import services.SalleService;
import util.HibernateUtil;

/**
 *
 * @author HP
 */
public class Test {

    public static void main(String[] args) {
         IDao<Salle> dao2 = new SalleService();
           IDao<Machine> dao = new MachineService();
           Salle s = new Salle("B2");
           dao2.create(s);
                   dao.create(new Machine("latitude", "DELL", 3000,s));
        dao.create(new Machine("thinkpad", "Lenovo", 2000,s));
        dao.create(new Machine("elitebook", "HP", 4000,s));
        
        for(Machine m: dao.findAll()){
            System.out.println(m);
    }


    }
}
