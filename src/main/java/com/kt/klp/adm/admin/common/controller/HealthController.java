package com.kt.klp.adm.admin.common.controller;

import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/health")
public class HealthController {

    @GetMapping(value = "/alive")
    public ResponseEntity<String> aliveCheck() {

        JSONObject jobj = new JSONObject();
        jobj.put("status", 200);
        jobj.put("success", "Y");

        return ResponseEntity.status(HttpStatus.OK).body(jobj.toJSONString());
    }
}
