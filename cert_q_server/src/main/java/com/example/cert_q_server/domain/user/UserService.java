package com.example.cert_q_server.domain.user;

public interface UserService {
    public User findByEmail(String email);
    public User save(User user);
    public void existsByEmail(String email);

}
