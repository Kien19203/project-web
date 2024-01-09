package model.dao;

import model.bean.Category;
import model.db.JDBIConnector;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class CategoryDAO {
    public static List<Category> getAll() {
        List<Category> categories = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("select * from category")
                        .mapToBean(Category.class).stream().collect(Collectors.toList())
        );
        return categories;
    }

    public static String insertCategory(String newCategoryName) {
        AtomicInteger newID = new AtomicInteger();
        JDBIConnector.me().useHandle(handle -> {
                    newID.set(handle.createUpdate("INSERT INTO category (name) VALUES (:name)")
                            .bind("name", newCategoryName)
                            .executeAndReturnGeneratedKeys("id")
                            .mapTo(Integer.class)
                            .one());
                }
        );
        return newID.get() + "";
    }

    public static void deleteNoUsedCategoryById(String id) {
        JDBIConnector.me().useHandle(handle ->
                handle.createUpdate("DELETE FROM category WHERE id=? AND id NOT IN(" +
                                "SELECT DISTINCT categoryId FROM product)")
                        .bind(0, id)
                        .execute()
        );
    }

    public static boolean checkNoUsedCategoryById(String id) {
        List<Integer> categoryId = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT DISTINCT categoryId FROM product WHERE categoryId=?")
                        .bind(0, id)
                        .mapTo(Integer.class)
                        .stream().collect(Collectors.toList())
        );
        return categoryId.isEmpty() ? false : true;
    }

    public static void updateCategoryNameById(String id, String newName) {
        JDBIConnector.me().useHandle(handle ->
                handle.createUpdate("UPDATE category SET name=:newName WHERE id=:id")
                        .bind("newName", newName)
                        .bind("id", id)
                        .execute()
        );
    }

    public static void main(String[] args) {
        updateCategoryNameById("2", "haha");
    }

}
