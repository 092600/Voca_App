package com.example.cert_q_server.config.account;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AccountRegistrationResponse {

    @JsonProperty("created")
    private boolean created;

}

