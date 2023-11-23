package hrport.project.main.adaptergson;

import com.google.gson.*;

import hrport.project.main.pojo.Risposta;

import java.lang.reflect.Type;

public class RispostaAdapter implements JsonSerializer<Risposta>{
	 	@Override
	    public JsonElement serialize(Risposta src, Type typeOfSrc, JsonSerializationContext context) {
	        JsonObject jsonObject = new JsonObject();
	        jsonObject.addProperty("id", src.getId());
	        jsonObject.addProperty("testo", src.getTesto());

	        // Non includere giusta
	        // Questo campo verrà omesso dalla serializzazione JSON

	        return jsonObject;
	    }
}
