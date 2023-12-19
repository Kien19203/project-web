package model.service;

import model.bean.Discount;
import model.dao.DiscountDAO;

import java.util.Date;
import java.util.List;

public class DiscountService {
    private static DiscountService instance;

    public static DiscountService getInstance() {
        if (instance == null) instance = new DiscountService();
        return instance;
    }

    public List<Discount> getAll() {
        return DiscountDAO.getAll();
    }

    public Discount getDiscountById(String id) {
        return DiscountDAO.getDiscountById(id);
    }

    public void addDiscount(String name, String startDate, String endDate, double percentageOff) {
        DiscountDAO.insertDiscount(name, startDate, endDate, percentageOff);
    }
    public void updateDiscount(String editDiscountId, String name, String startDate, String endDate, double percentageOff) {
        DiscountDAO.updateDiscount(editDiscountId, name, startDate, endDate, percentageOff);
    }

    public void deleteDiscountById(String id) {
        DiscountDAO.deleteDiscountById(id);
    }

}
