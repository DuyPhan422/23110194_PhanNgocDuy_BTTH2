package vn.iotstart.service;

import vn.iotstart.model.User;

public interface UserService {
    User login(String username, String password);
    User get(String username);
}