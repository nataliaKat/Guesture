package service;

import dao.GroupCustomerDao;
import dao.GroupingDao;
import model.GroupCustomer;
import model.Grouping;

public class GroupCustomerService {

    public void save(Grouping g, int reservationId) {
        GroupingDao groupingDao = new GroupingDao();
        GroupCustomerDao groupCustomerDao = new GroupCustomerDao();
        int savedId = groupingDao.save(g, reservationId);
        if (savedId != -1) {
            for (GroupCustomer groupCustomer : g.getGroupCustomers()) {
                groupCustomerDao.save(groupCustomer, savedId);
                System.out.println(groupCustomer);
            }
        }

    }

}
