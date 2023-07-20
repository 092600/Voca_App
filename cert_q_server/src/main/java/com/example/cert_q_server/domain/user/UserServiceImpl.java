package com.example.cert_q_server.domain.user;

import com.example.cert_q_server.config.account.AccountPrepareRequest;
import com.example.cert_q_server.utils.ImageUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.io.IOException;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserRepo userRepo;
    private final ImageUtil imageUtil;

    public User findByEmail(String email) {
        return userRepo.findByEmail(email)
                .orElseThrow(
                        () -> new UsernameNotFoundException("User not found"));
    }


    @Transactional
    public void prepare(AccountPrepareRequest request){
        // "user.status"
        // UserStatus.PREPARE => UserStatus.ACTIVE
        User user = findByEmail(request.getEmail());
        user.prepare();

        // 언어 추가
        request.getLanguagies().forEach((lang) -> user.getLanguagies().add(lang));

        try {
            if (request.getImage() != null) {
                // Profile Image 저장
                imageUtil.saveUserProfileImage(user, request.getImage());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

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
