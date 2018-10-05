package com.leeder.demo.utils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

public class DataTimeJsonSerializer extends JsonSerializer<Date>{
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


	@Override
	public void serialize(Date value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
		String text = sdf.format(value);
		gen.writeString(text);		
	}
	

}
