package com.example.cert_q_server.utils;

import com.example.cert_q_server.domain.user.User;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Getter
@Component
public class ImageUtil {

    @Value("${application.auth.user-profile-path}")
    private String RootProfilePath;

    public void saveUserProfileImage(User user, MultipartFile image) throws IOException {
        String userDirPath = RootProfilePath + "/" + user.getId();

        File userDirectory = new File(userDirPath);
        if (!userDirectory.exists()) {
            userDirectory.mkdirs();
        }

        String imagePath = userDirPath + "/profile.jpg";

        File profile = new File(imagePath);
        image.transferTo(profile);
    }
}
