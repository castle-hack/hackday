package com.morganstanley.spring.config.client.model;

import lombok.Builder;

@Builder
public record PropertiesResponse(String profile,
                                 String greeting) {
}
