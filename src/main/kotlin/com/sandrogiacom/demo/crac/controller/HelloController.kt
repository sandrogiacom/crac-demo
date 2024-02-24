package com.sandrogiacom.demo.crac.controller

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloController {

    @GetMapping("/hello")
    fun hello(): String{
        return "Hello from CRaC!"
    }

}