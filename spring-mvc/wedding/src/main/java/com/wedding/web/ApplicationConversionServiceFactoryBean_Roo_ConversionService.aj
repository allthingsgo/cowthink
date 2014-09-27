// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.wedding.web;

import com.wedding.domain.Rsvp;
import com.wedding.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Rsvp, String> ApplicationConversionServiceFactoryBean.getRsvpToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.wedding.domain.Rsvp, java.lang.String>() {
            public String convert(Rsvp rsvp) {
                return new StringBuilder().append(rsvp.getCode()).append(' ').append(rsvp.getEmail()).append(' ').append(rsvp.getAttending()).append(' ').append(rsvp.getSpecialRequests()).toString();
            }
        };
    }
    
    public Converter<Long, Rsvp> ApplicationConversionServiceFactoryBean.getIdToRsvpConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.wedding.domain.Rsvp>() {
            public com.wedding.domain.Rsvp convert(java.lang.Long id) {
                return Rsvp.findRsvp(id);
            }
        };
    }
    
    public Converter<String, Rsvp> ApplicationConversionServiceFactoryBean.getStringToRsvpConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.wedding.domain.Rsvp>() {
            public com.wedding.domain.Rsvp convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Rsvp.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getRsvpToStringConverter());
        registry.addConverter(getIdToRsvpConverter());
        registry.addConverter(getStringToRsvpConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
