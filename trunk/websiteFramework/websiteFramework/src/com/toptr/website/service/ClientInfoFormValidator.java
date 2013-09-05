package com.toptr.website.service;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.toptr.website.pojo.ClientInfo;

@Component("clientInfoFormValidator")
public class ClientInfoFormValidator implements Validator
{
    @SuppressWarnings("unchecked")
    @Override
    public boolean supports(Class clazz)
    {
        return ClientInfo.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object model, Errors errors)
    {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "clientname","required.clientname", "Name is required.");
    }
}

