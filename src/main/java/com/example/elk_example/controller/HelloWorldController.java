package com.example.elk_example.controller;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class HelloWorldController
{
    private static final Logger LOGGER = LogManager.getLogger(HelloWorldController.class);

    @GetMapping("/")
    public String home(){
        try{
            throw new Exception("Demo Exception");
        }
        catch(Exception ex){
            LOGGER.error(ex.getMessage());
            return "Error occurred";
        }
    }

    @GetMapping("/helloWorld")
    public String helloWorld()
    {
        LOGGER.info("Hello World Endpoint hit");
        LOGGER.debug("Debugging log");
        LOGGER.info("Info log");
        LOGGER.warn("Hey, This is a warning!");
        LOGGER.error("Oops! We have an Error. OK");
        LOGGER.fatal("Damn! Fatal error. Please fix me.");
        return "Hello World";
    }
}
