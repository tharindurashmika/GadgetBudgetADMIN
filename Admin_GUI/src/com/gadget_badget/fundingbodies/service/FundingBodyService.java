package com.gadget_badget.fundingbodies.service;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;

import com.gadget_badget.fundingbodies.model.FundingBodyServlet;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Path("/Admin") 
public class FundingBodyService 
{	
	FundingBodyServlet orderObj = new FundingBodyServlet(); 
	
	@GET
	@Path("/") 
	@Produces(MediaType.TEXT_HTML) 
	public String readFunds() 
	{ 
		return orderObj.readFunds(); 
	} 	

	
	@POST
	@Path("/") 
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED) 
	@Produces(MediaType.TEXT_PLAIN) 
	public String insertFunds(
		 @FormParam("Name") String name, 
		 @FormParam("Field") String field, 
		 @FormParam("Range") String range)
		 
	{ 
		String output = orderObj.insertFunds(name, field, range); 
		return output; 
	}	
	
	
	@PUT
	@Path("/") 
	@Consumes(MediaType.APPLICATION_JSON) 
	@Produces(MediaType.TEXT_PLAIN) 
	public String updateFunds(String fundData) 
	{ 
		//Convert the input string to a JSON object 
		 JsonObject orderObject = new JsonParser().parse(fundData).getAsJsonObject(); 
		//Read the values from the JSON object
		 String id = orderObject.get("ID").getAsString(); 
		 String name = orderObject.get("FundName").getAsString(); 
		 String field = orderObject.get("Field").getAsString(); 
		 String range = orderObject.get("Range").getAsString(); 
		 
		 String output = orderObj.updateFunds(id, name, field, range); 
		 return output; 
	}
	
	
	@DELETE
	@Path("/") 
	@Consumes(MediaType.APPLICATION_XML) 
	@Produces(MediaType.TEXT_PLAIN) 
	public String deleteFunds(String fundData) 
	{ 
		//Convert the input string to an XML document
		 Document doc = Jsoup.parse(fundData, "", Parser.xmlParser()); 
		 
		//Read the value from the element <itemID>
		 String orderID = doc.select("ID").text(); 
		 String output = orderObj.deleteFunds(orderID); 
		 return output; 
	}
}