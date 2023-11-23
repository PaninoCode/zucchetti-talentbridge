package hrport.project.main.adaptergson;
import com.google.gson.*;
import com.google.gson.reflect.TypeToken;

import hrport.project.main.pojo.Domanda;
import hrport.project.main.pojo.Risposta;

import java.lang.reflect.Type;
import java.util.List;

public class DomandaAdapter implements JsonSerializer<Domanda> {

	@Override
    public JsonElement serialize(Domanda src, Type typeOfSrc, JsonSerializationContext context) {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("id", src.getId());
        jsonObject.addProperty("testo", src.getTesto());

        // Non includere punteggio e giusta
        // Questi campi verranno omessi dalla serializzazione JSON

        // Serializza l'array di Risposte
        JsonArray risposteArray = new JsonArray();
        for (Risposta risposta : src.getRisposte()) {
            risposteArray.add(context.serialize(risposta));
        }
        jsonObject.add("risposte", risposteArray);

        return jsonObject;
    }
}
