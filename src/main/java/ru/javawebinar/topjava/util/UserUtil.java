package ru.javawebinar.topjava.util;

import ru.javawebinar.topjava.model.AbstractNamedEntity;
import ru.javawebinar.topjava.model.Role;
import ru.javawebinar.topjava.model.User;

import java.util.Arrays;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

public class UserUtil {

    public static final List<User> users = Arrays.asList(
            new User(null, "Admin", "admin@admin.com", "Admin", 1, true, new HashSet<>(Arrays.asList(Role.ADMIN, Role.USER))),
            new User(null, "User", "user@user.com", "User", 2500, true, new HashSet<>(Arrays.asList(Role.USER)))
    );

    public static List<User> getSortByName(List<User> users) {
        return SortByComparator(users, Comparator.comparing(AbstractNamedEntity::getName));
    }

    private static List<User> SortByComparator(List<User> users, Comparator<AbstractNamedEntity> comparing) {
        return users.stream().sorted(comparing).collect(Collectors.toList());
    }
}
