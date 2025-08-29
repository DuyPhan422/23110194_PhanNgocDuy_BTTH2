package vn.iotstart.service;

import vn.iotstart.model.User;

public interface UserService {
    User login(String username, String password);
    User get(String username);
    User getByEmail(String email);

    void insert(User user);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
	boolean register(String email, String password, String username, String fullname, String phone);
}