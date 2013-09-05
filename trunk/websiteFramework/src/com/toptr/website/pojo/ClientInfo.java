package com.toptr.website.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;

@Entity
@Table(name="CLIENTINFO")
public class ClientInfo
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column private String clientcode;
    @Column private String clientname;
    @Column private String status;
    @Column private Date inputdate;
    @Column private String email;
    @Column private String phone;
    
    @Override
    public String toString()
    {
        return ToStringBuilder.reflectionToString(this);
    }
    //setters & getters    
}
