package hrport.project.main.adaptergson;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.lang.reflect.Type;


import hrport.project.main.pojo.Quiz;

public class QuizListAdapter implements JsonSerializer<Quiz> {

    @Override
    public JsonElement serialize(Quiz src, Type typeOfSrc, JsonSerializationContext context) {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("id", src.getId());
        jsonObject.addProperty("nome", src.getNome());
        jsonObject.addProperty("isDone", src.isDone());

        // Non includere listaDomande
        // La lista verrà omessa dalla serializzazione JSON

        return jsonObject;
    }
}
