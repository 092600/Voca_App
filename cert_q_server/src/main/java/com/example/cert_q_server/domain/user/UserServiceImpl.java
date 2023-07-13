package com.example.cert_q_server.domain.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserRepo userRepo;

    public User findByEmail(String email) {
        return userRepo.findByEmail(email)
                .orElseThrow(
                        () -> new UsernameNotFoundException("User not found"));
    }

    public User save(User user) {
        return userRepo.save(user);
    }

    public void existsByEmail(String email) {
        userRepo.findByEmail(email).ifPresent(m -> {
            throw new IllegalStateException("Alreday exists User");
        });
    }

}
