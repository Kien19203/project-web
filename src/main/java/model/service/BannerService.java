package model.service;

import model.bean.BannerItem;
import model.bean.Tip;
import model.dao.BannerItemDAO;
import model.dao.TipDAO;

import java.util.List;

public class BannerService {
    private static BannerService instance;

    public static BannerService getInstance() {
        if (instance == null) instance = new BannerService();
        return instance;
    }

    public List<BannerItem> getAll() {
        return BannerItemDAO.getAll();
    }

    public BannerItem getBannerItemByTitle(String title) {
        return BannerItemDAO.getBannerItemByTitle(title);
    }

    public void deleteBannerByTitle(String title) {
        BannerItemDAO.deleteBannerByTitle(title);
    }

    public static void updateByTitle(String oldTitle, String newTitle, String description) {
        BannerItemDAO.updateByTitle(oldTitle, newTitle, description);
    }

    public static void main(String[] args) {
        System.out.println(BannerService.getInstance().getAll());
    }
}
