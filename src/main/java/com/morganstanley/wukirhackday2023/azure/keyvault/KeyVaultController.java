package com.morganstanley.wukirhackday2023.azure.keyvault;

import com.azure.core.http.policy.HttpLogDetailLevel;
import com.azure.core.http.policy.HttpLogOptions;
import com.azure.identity.DefaultAzureCredentialBuilder;
import com.azure.security.keyvault.secrets.SecretClient;
import com.azure.security.keyvault.secrets.SecretClientBuilder;
import com.azure.security.keyvault.secrets.models.KeyVaultSecret;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class KeyVaultController {
    private static final Logger LOGGER = LoggerFactory.getLogger(KeyVaultController.class);
    @GetMapping("/")
    public String index()
    {
        return "hello from azure kv";
    }
    @GetMapping("/kv")
    public String getKeyVaultValue()
    {
        return getStoredValue("hello-world");
    }
    private String getStoredValue(String keyName){
        String keyVaultName = "floreiva-kv";
        String keyVaultUri = "https://" + keyVaultName + ".vault.azure.net";
        SecretClient secretClient = new SecretClientBuilder()
                .vaultUrl(keyVaultUri)
                .httpLogOptions(new HttpLogOptions().setLogLevel(HttpLogDetailLevel.BODY_AND_HEADERS))
                .credential(new DefaultAzureCredentialBuilder()
                        .build())
                .buildClient();
        KeyVaultSecret storedSecret = secretClient.getSecret(keyName);
        LOGGER.info("property value: {}", storedSecret.getValue());
        return storedSecret.getValue();
    }
}
