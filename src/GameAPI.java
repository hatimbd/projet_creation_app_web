import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mysql.cj.jdbc.MysqlDataSource;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GameAPI implements HttpHandler {
    @Override
    public void handle(HttpExchange exchange) throws IOException {
        String method = exchange.getRequestMethod();

        if ("POST".equals(method)) {
            handlePostRequest(exchange);
        } else if ("GET".equals(method)) {
            handleGetRequest(exchange);
        } else {
            exchange.sendResponseHeaders(405, -1); // Method Not Allowed
        }
    }

    private void handlePostRequest(HttpExchange exchange) throws IOException {
        // Read request body
        String body = new String(exchange.getRequestBody().readAllBytes());
        JsonObject json = JsonParser.parseString(body).getAsJsonObject();

        String action = json.get("action").getAsString();
        if ("createGame".equals(action)) {
            createGame(exchange, json);
        } else {
            exchange.sendResponseHeaders(400, -1); // Bad Request
        }
    }

    private void handleGetRequest(HttpExchange exchange) throws IOException {
        // Implementation of GET request handling
    }

    private void createGame(HttpExchange exchange, JsonObject json) throws IOException {
        String player1 = json.get("player1").getAsString();
        String player2 = json.get("player2").getAsString();

        try (Connection conn = getDatabaseConnection()) {
            // Insert players into database
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO players (name) VALUES (?), (?)", PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setString(1, player1);
            stmt.setString(2, player2);
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            int player1Id = rs.getInt(1);
            rs.next();
            int player2Id = rs.getInt(1);

            // Create game
            stmt = conn.prepareStatement("INSERT INTO games (player1_id, player2_id, status) VALUES (?, ?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, player1Id);
            stmt.setInt(2, player2Id);
            stmt.setString(3, "new");
            stmt.executeUpdate();

            rs = stmt.getGeneratedKeys();
            rs.next();
            int gameId = rs.getInt(1);

            // Create cards for the game
            String[] colors = {
                "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue",
                "gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray",
                "black", "black"
            };

            for (String color : colors) {
                stmt = conn.prepareStatement("INSERT INTO cards (game_id, color, word) VALUES (?, ?, ?)");
                stmt.setInt(1, gameId);
                stmt.setString(2, color);
                stmt.setString(3, ""); // Placeholder for word
                stmt.executeUpdate();
            }

            String response = new JsonObject().addProperty("status", "success").addProperty("gameId", gameId).toString();
            exchange.sendResponseHeaders(200, response.length());
            OutputStream os = exchange.getResponseBody();
            os.write(response.getBytes());
            os.close();
        } catch (SQLException e) {
            e.printStackTrace();
            exchange.sendResponseHeaders(500, -1); // Internal Server Error
        }
    }

    private Connection getDatabaseConnection() throws SQLException {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setUser("yourDatabaseUsername");
        dataSource.setPassword("yourDatabasePassword");
        dataSource.setServerName("yourDatabaseServer");
        dataSource.setDatabaseName("yourDatabaseName");
        return dataSource.getConnection();
    }
}
