
package ru.javawebinar.topjava.web;

import org.slf4j.Logger;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.util.MealsUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;

import static org.slf4j.LoggerFactory.getLogger;

public class MealServlet extends HttpServlet {
    private static final Logger log = getLogger(MealServlet.class);
    private static String MEALS = "/meals.jsp";
    private static String ADD_OR_EDIT = "/editMeal.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.debug("redirect to meals");
//        super.doGet(req, resp);
        String forward = "";
        String action = req.getParameter("action");
        if (action == null) {
            req.setAttribute("mealsToList", MealsUtil.getMeals());
            forward = MEALS;
        } else if (action.equalsIgnoreCase("delete")) {
            long id = Long.parseLong(req.getParameter("mealId"));
            MealsUtil.deleteMeal(id);
            forward = MEALS;
            req.setAttribute("mealsToList", MealsUtil.getMeals());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = ADD_OR_EDIT;
            long id = Long.parseLong(req.getParameter("mealId"));
            Meal meal = MealsUtil.getMealById(id);
            req.setAttribute("meal", meal);
        } else {
            forward = ADD_OR_EDIT;
        }
        req.getRequestDispatcher(forward).forward(req, resp);
//        resp.sendRedirect("meals.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("mealId");
        LocalDateTime dateTime = LocalDateTime.parse(req.getParameter("dateTime"));
        String description = req.getParameter("description");
        int calories = Integer.parseInt(req.getParameter("calories"));
        if (id == null || id.isEmpty()) {
            MealsUtil.addMeal(new Meal(dateTime, description, calories));
        } else {
            long mealId = Integer.parseInt(id);
            MealsUtil.editMeal(mealId, dateTime, description, calories);
        }
        req.setAttribute("mealsToList", MealsUtil.getMeals());
        req.getRequestDispatcher(MEALS).forward(req,resp);
    }
}

