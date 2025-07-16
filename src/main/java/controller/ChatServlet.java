<<<<<<< HEAD
//package controller;
//
//import chatbotDAO.ChatbotDAO;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.*;
//import java.net.HttpURLConnection;
//import java.net.URL;
//import java.util.stream.Collectors;
//import org.json.JSONArray;
//import org.json.JSONObject;
//
//@WebServlet(name = "ChatServlet", urlPatterns = {"/ChatServlet"})
//public class ChatServlet extends HttpServlet {
//    private static final String XAI_API_KEY = "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";
//    private static final String API_URL = "https://openrouter.ai/api/v1/chat/completions";
//    private final ChatbotDAO chatbotDAO = new ChatbotDAO();
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.sendRedirect("/LigmaBallsOfficial/ligmaShop/chat/chatbox.jsp");
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("text/plain; charset=UTF-8");
//        response.setCharacterEncoding("UTF-8");
//
//        PrintWriter out = response.getWriter();
//        String message = request.getParameter("message");
//
//        if (message == null || message.trim().isEmpty()) {
//            out.print("Vui lòng nhập tin nhắn!");
//            return;
//        }
//        message = message.trim();
//
//        String reply;
//        String productName = extractProductName(message);
//        String size = extractSize(message);
//        String color = extractColor(message);
//        String dbData = "";
//
//        if (message.equalsIgnoreCase("hello") || message.equalsIgnoreCase("chào shop") || 
//            message.equalsIgnoreCase("shop ơi") || message.equalsIgnoreCase("shop") || message.contains("cho mình hỏi")) {
//            reply = "Chào bạn! Rất vui được trò chuyện với bạn. Mình là chatbot của Ligma Shop, sẵn sàng giúp bạn với các câu hỏi về sản phẩm. Bạn khỏe không? Có gì thú vị đang xảy ra không?";
//            out.print(reply);
//            return;
//        } 
//	else if (message.contains("cảm ơn shop") || message.contains("thanks")) {
//            reply = "Không có gì đâu bạn! Ligma Shop luôn sẵn lòng hỗ trợ bạn. Bạn cần giúp gì thêm không?";
//            out.print(reply);
//            return;
//        } 
//	else if (message.contains("người yêu") || message.contains("da den") || message.contains("Travis Scott") || message.contains("FE!N")) {
//            reply = """
//                    [Intro: Travis Scott & Sheck Wes]
//                    Just come outside for the night (Yeah)
//                    Take your time, get your light (Yeah)
//                    Johnny Dang, yeah, yeah
//                    I been out geekin' (Bitch)
//                    
//                    [Chorus: Travis Scott]
//                    FE!N, FE!N, FE!N, FE!N, FE!N (Yeah)
//                    FE!N, FE!N, FE!N, FE!N, FE!N (Yeah)
//                    FE!N, FE!N, FE!N, FE!N, FE!N
//                    FE!N, FE!N (Yeah), FE!N, FE!N, FE!N
//                    
//                    [Verse 1: Travis Scott & Sheck Wes]
//                    The career's more at stake when you in your prime (At stake)
//                    Fuck that paper, baby, my face on the dotted line (Dot, yeah)
//                    I been flyin' out of town for some peace of mind (Yeah, yeah, bitch)
//                    It's like always they just want a piece of mine (Ah)
//                    I been focused on the future, never on right now (Ah)
//                    What I'm sippin' not kombucha, either pink or brown (It's lit)
//                    I'm the one that introduced you to the you right now (Mm, let's go)
//                    Oh my God, that bitch bitin' (That bitch bitin')
//                    Well, alright (Alright), tryna vibe (I'm tryna vibe this)
//                    In the night, come alive
//                    Ain't asleep, ain't a—, ain't a—, ain't-ain't
//                    
//                    [Chorus: Travis Scott]
//                    FE!N, FE!N, FE!N, FE!N, FE!N
//                    FE!N, FE!N, FE!N, FE!N, FE!N
//                    FE!N, FE!N, FE!N, FE!N, FE!N
//                    FE!N, FE!N, FE!N, FE!N
//                    FE!N, FE!N, FE!N, FE!N, FE!N
//                    
//                    [Bridge: Playboi Carti]
//                    Schyeah, woah, what?
//                    What?
//                    (Homixide, Homixide, Homixide, Homixide)
//                    What? (Yeah)
//                    Woah, woah (Yeah, yeah)
//                    (Homixide, Homixide, Homixide, Homixide)
//                    Hit, yeah, hold up (Yeah)
//                    
//                    [Verse 2: Playboi Carti]
//                    Yeah, I just been poppin' my shit and gettin' it live, hold up (Shit)
//                    Yeah, you try to come wrong 'bout this shit, we poppin' your tires, hold up (Shit)
//                    Uh, hundred-round (Woah), feelin' like I'm on ten
//                    Playin' both sides with these hoes (Hold up), shawty, I'm fuckin' your friend (Hold up)
//                    I've been goin' crazy, shawty, I've been in the deep end
//                    She not innocent, uh, she just tryna go
//                    
//                    [Chorus: Travis Scott & Playboi Carti]
//                    FE!N (Talkin' 'bout), FE!N, FE!N (Schyeah), FE!N, FE!N (Schyeah, oh, oh, what? Schyeah)
//                    FE!N, FE!N (Schyeah), FE!N, FE!N, FE!N (Oh, oh)
//                    FE!N, FE!N (Talkin' 'bout), FE!N, FE!N, FE!N, FE!N (Talkin' 'bout, let's go)
//                    
//                    [Verse 3: Playboi Carti & Travis Scott]
//                    I just been icin' my hoes, I just been drippin' my hoes (Drippin' my hoes)
//                    This is a whole 'nother level, shawty (Oh), I got these hoes on they toes (Hoes on they toes)
//                    I put the bitch on the road, she tryna fuck on the O, hold up, hold up
//                    I got this ho with me, she tryna show me somethin', hold up, hold up (Oh)
//                    I got flows for days, these niggas ain't on nothin', hold up, yeah (Oh)
//                    Me and my boy locked in, you know we on one, hold up, uh (Slatt, slatt)
//                    We in the spot goin' crazy until the sun up
//                    You worried about that ho, that ho done chose up (Slatt, bitch-ass)
//                    Uh, pistols all in the kitchen, can't give the zip code up, hold up, yeah, slatt (Wow)
//                    FE!N, FE!N, FE!N (Huh? Huh? Huh? Huh? Yeah)
//                    Why the fuck these niggas actin' like they know us?
//                    00CACTUS, yeah, we towed up (Skrrt, skrrt), uh, yeah
//                    Switch out the bag, these niggas get rolled up, hold up (It's lit), slatt
//                    Everything hit, hold up, everything Homixide, Homixide (Homixide, Homixide, Homixide, Homixide)
//                    [Outro: Travis Scott & Playboi Carti]
//                    FE!N, FE!N, FE!N, FE!N, FE!N, FE!N (Homixide, Homixide, Homixide, Homixide, Homixide, Homixide, Homixide)
//                    """;
//            out.print(reply);
//            return;
//        } 
//	else if (message.contains("Kendrick Lamar") || message.contains("Say Drake") || message.contains("OVHO") || message.contains("A Minor")) {
//            reply = """
//                    Ayy, Mustard on the beat, ho
//                    Deebo any rap nigga, he a free throw
//                    Man down, call an amberlamps, tell him, "Breathe, bro"
//                    Nail a nigga to the cross, he walk around like Teezo
//                    What's up with these jabroni-ass niggas tryna see Compton?
//                    The industry can hate me, fuck 'em all and they mama
//                    How many opps you really got? I mean, it's too many options
//                    I'm finna pass on this body, I'm John Stockton
//                    Beat your ass and hide the Bible if God watchin'
//                    Sometimes you gotta pop out and show niggas
//                    Certified boogeyman, I'm the one that up the score with 'em
//                    Walk him down, whole time, I know he got some ho in him
//                    Pole on him, extort shit, bully Death Row on him
//                    Say, Drake, I hear you like 'em young
//                    You better not ever go to cell block one
//                    To any bitch that talk to him and they in love
//                    Just make sure you hide your lil' sister from him
//                    They tell me Chubbs the only one that get your hand-me-downs
//                    And Party at the party playin' with his nose now
//                    And Baka got a weird case, why is he around?
//                    Certified Lover Boy? Certified pedophiles
//                    Wop, wop, wop, wop, wop, Dot, fuck 'em up
//                    Wop, wop, wop, wop, wop, I'ma do my stuff
//                    Why you trollin' like a bitch? Ain't you tired?
//                    Tryna strike a chord and it's probably A minor
//                    
//                    They not like us, they not like us, they not like us
//                    They not like us, they not like us, they not like us
//                    """;
//            out.print(reply);
//            return;
//        } 
//	else if (message.contains("schyeah") || message.contains("Carti")) {
//            reply = """
//                    SCHYEAH
//                    IT'S CARTI WORLD
//                    """;
//            out.print(reply);
//            return;
//        }
//        if (message.contains("giá") || message.contains("bao nhiêu")) {
//            dbData = chatbotDAO.getPrice(productName);
//        } 
//	else if (message.contains("kích cỡ") || message.contains("size")) {
//            dbData = chatbotDAO.getSizes(productName);
//        } 
//	else if (message.contains("màu") || message.contains("color")) {
//            dbData = chatbotDAO.getColors(productName);
//        } 
//	else if (message.contains("có") && message.contains("không")) {
//            dbData = chatbotDAO.checkAvailabilityWithSizeAndColor(productName, size, color);
//        } 
//	else if (message.contains("giảm") || message.contains("discount")) {
//            dbData = chatbotDAO.getDiscount(productName);
//        } 
//	else if (message.contains("đánh giá") || message.contains("rating")) {
//            dbData = chatbotDAO.getRating(productName);
//        } 
//	else if (message.contains("tất cả sản phẩm")) {
//            dbData = chatbotDAO.getAllProducts();
//        } 
//	else if (message.contains("danh mục") || message.contains("category") || message.contains("loại")) {
//            String categoryName = extractCategoryName(message);
//            dbData = chatbotDAO.getProductsByCategory(categoryName);
//        } 
//	else if (message.contains("áo") && message.contains("nam")) {
//            dbData = chatbotDAO.getProductsByCategory("Áo Nam");
//        } 
//	else if (message.contains("quần") && message.contains("nữ")) {
//            dbData = chatbotDAO.getProductsByCategory("Quần Nữ");
//        } 
//	else if (message.contains("áo") && message.contains("nữ")) {
//            dbData = chatbotDAO.getProductsByCategory("Áo Nữ");
//        } 
//	else if (message.contains("quần") && message.contains("nam")) {
//            dbData = chatbotDAO.getProductsByCategory("Quần Nam");
//        } 
//	else if ((message.contains("áo quần") || message.contains("quần áo")) && message.contains("nam")) {
//            dbData = chatbotDAO.getProductsByCategory("Quần áo Nam");
//        } 
//	else if ((message.contains("áo quần") || message.contains("quần áo")) && message.contains("nữ")) {
//            dbData = chatbotDAO.getProductsByCategory("Quần áo Nữ");
//        } 
//	else if (message.contains("áo khoác")) {
//            dbData = chatbotDAO.getProductsByCategory("Áo khoác");
//        } 
//	else if (message.contains("đầm")) {
//            dbData = chatbotDAO.getProductsByCategory("Đầm");
//        } 
//	else if (message.contains("đồ thể thao")) {
//            dbData = chatbotDAO.getProductsByCategory("Đồ thể thao");
//        } 
//	else if (message.contains("thời trang mùa đông") || message.contains("đông") || message.contains("mùa đông") || message.contains("lạnh")) {
//            dbData = chatbotDAO.getProductsByCategory("Thời trang mùa đông");
//        } 
//	else if (message.contains("thời trang mùa hè") || message.contains("mùa hè") || message.contains("hè") || message.contains("nóng")) {
//            dbData = chatbotDAO.getProductsByCategory("Thời trang mùa hè");
//        } 
//        else {
//            dbData = "";
//        }
//
//        if (!dbData.isEmpty()) {
//            reply = callGrokWithDB(message, dbData);
//        } 
//        else {
//            reply = "Mình chưa hiểu câu hỏi của bạn lắm, bạn có thể hỏi về sản phẩm không?";
//        }
//
//        out.print(reply);
//    }
//
//    private String callGrokWithDB(String message, String dbData) {
//        try {
//            URL url = new URL(API_URL);
//            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//            conn.setRequestMethod("POST");
//            conn.setRequestProperty("Content-Type", "application/json");
//            conn.setRequestProperty("Authorization", "Bearer " + XAI_API_KEY);
//            conn.setDoOutput(true);
//
//            String systemContent = "Bạn là chatbot hỗ trợ mua sắm của Ligma Shop. Chỉ trả lời dựa trên dữ liệu từ database được cung cấp dưới đây. Nếu dữ liệu cho biết không tìm thấy sản phẩm, chỉ trả lại thông điệp đó và không gợi ý thêm bất kỳ sản phẩm nào khác. Không tự ý trả lời các câu hỏi ngoài phạm vi sản phẩm, tài khoản, giao hàng, hoặc hỗ trợ khách hàng. Giữ định dạng danh sách sản phẩm với dấu gạch ngang (-) và xuống dòng cho mỗi mục:\n" + escapeJson(dbData);
//            String jsonInput = "{\"model\": \"deepseek/deepseek-chat:free\", \"messages\": [" +
//                    "{\"role\": \"system\", \"content\": \"" + escapeJson(systemContent) + "\"}," +
//                    "{\"role\": \"user\", \"content\": \"" + escapeJson(message) + "\"}" +
//                    "]}";
//
//            System.out.println("jsonInput gửi đi: " + jsonInput);
//
//            try (OutputStream os = conn.getOutputStream()) {
//                os.write(jsonInput.getBytes("UTF-8"));
//                os.flush();
//            }
//
//            int responseCode = conn.getResponseCode();
//            System.out.println("Mã phản hồi: " + responseCode);
//            if (responseCode == HttpURLConnection.HTTP_OK) {
//                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//                String response = br.lines().collect(Collectors.joining());
//                conn.disconnect();
//
//                JSONObject json = new JSONObject(response);
//                JSONArray choices = json.getJSONArray("choices");
//                if (choices.length() > 0) {
//                    JSONObject choice = choices.getJSONObject(0);
//                    JSONObject messageObj = choice.getJSONObject("message");
//                    return messageObj.getString("content");
//                }
//                return "Không nhận được phản hồi từ API.";
//            } else {
//                return "Lỗi API: Mã phản hồi " + responseCode;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "Lỗi: " + e.getMessage();
//        }
//    }
//
//    private String escapeJson(String input) {
//        if (input == null) return "";
//        return input.replace("\\", "\\\\")
//                    .replace("\"", "\\\"")
//                    .replace("\n", "\\n")
//                    .replace("\r", "\\r")
//                    .replace("\t", "\\t");
//    }
//
//    // Extract methods remain unchanged
//    private String extractProductName(String message) {
//        String[] keywords = {"giá", "bao nhiêu", "kích cỡ", "size", "màu", "color", "có", "không",
//            "giảm", "discount", "đánh giá", "rating", "thế nào", "những nào", "gì",
//            "sản phẩm", "những", "\\?", "nào", "và", "là", "danh mục", "category",
//            "trong", "loại", "bán", "như thế nào", "muốn", "mua"};
//        String productName = message;
//
//        for (String keyword : keywords) {
//            productName = productName.replaceAll(keyword, "").trim();
//        }
//
//        String size = extractSize(message);
//        String color = extractColor(message);
//        if (size != null) {
//            productName = productName.replaceAll("(?i)" + size, "").trim();
//        }
//        if (color != null) {
//            productName = productName.replaceAll("(?i)" + color, "").trim();
//        }
//
//        return productName;
//    }
//
//    private String extractSize(String message) {
//        String[] sizeKeywords = {"size", "kích cỡ", "kich co"};
//        String[] sizes = {"xxl", "xl", "l", "XXL", "XL", "L"};
//        for (String keyword : sizeKeywords) {
//            if (message.contains(keyword)) {
//                for (String size : sizes) {
//                    if (message.contains(size)) {
//                        return size.toUpperCase();
//                    }
//                }
//            }
//        }
//        for (String size : sizes) {
//            if (message.contains(size)) {
//                return size.toUpperCase();
//            }
//        }
//        return null;
//    }
//
//    private String extractColor(String message) {
//        String[] colorKeywords = {"màu", "mau", "color"};
//        String[] colors = {"đen", "trắng", "xanh", "den", "trang", "blue", "Đen", "Trắng", "Blue"};
//        for (String keyword : colorKeywords) {
//            if (message.contains(keyword)) {
//                for (String color : colors) {
//                    if (message.contains(color)) {
//                        return switch (color.toLowerCase()) {
//                            case "den" -> "đen";
//                            case "trang" -> "trắng";
//                            case "blue" -> "xanh";
//                            default -> color;
//                        };
//                    }
//                }
//            }
//        }
//        for (String color : colors) {
//            if (message.contains(color)) {
//                return switch (color.toLowerCase()) {
//                    case "den" -> "đen";
//                    case "trang" -> "trắng";
//                    case "blue" -> "xanh";
//                    default -> color;
//                };
//            }
//        }
//        return null;
//    }
//
//    private String extractCategoryName(String message) {
//        String[] keywords = {"danh mục", "category", "trong", "có", "gì", "nào", "\\?", "của", "các", "loại", "mà", "shop", "bán"};
//        String categoryName = message;
//        for (String keyword : keywords) {
//            categoryName = categoryName.replaceAll(keyword, "").trim();
//        }
//        return categoryName;
//    }
//}
=======
package controller;

import dao.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.stream.Collectors;
import org.json.JSONArray;
import org.json.JSONObject; // Thêm thư viện JSON (ví dụ: org.json)


@WebServlet(name = "ChatServlet", urlPatterns = {"/ChatServlet"})
public class ChatServlet extends HttpServlet {

    private static final String XAI_API_KEY = "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"; // Thay bằng API key của xAI
    private static final String API_URL = "https://openrouter.ai/api/v1/chat/completions"; // URL API của xAI (giả định)

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("/LigmaBallsOfficial/chat/chatbox.jsp");
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/plain; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    PrintWriter out = response.getWriter();
    String message = request.getParameter("message");

    if (message != null && !message.trim().isEmpty()) {
        message = message.trim();
    } else {
        out.print("Vui lòng nhập tin nhắn!");
        return;
    }

    String reply;
    // Thông tin kết nối SQL Server
    String url = "jdbc:sqlserver://localhost:1433;databaseName=LigmaShop;encrypt=true;trustServerCertificate=true;useUnicode=true;characterEncoding=UTF-8"; // Thay bằng URL của bạn
    String username = "sa"; // Thay bằng tên người dùng
    String password = "Hahoang05092004"; // Thay bằng mật khẩu
    String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    try {
        Class.forName(driverName); // Đăng ký driver
    } catch (ClassNotFoundException e) {
        reply = "❌ Lỗi: Không tìm thấy driver JDBC - " + e.getMessage();
        out.print(reply);
        return;
    }

    try (Connection conn = DriverManager.getConnection(url, username, password)) {
        String productName = extractProductName(message);
        String size = extractSize(message);
        String color = extractColor(message);
        String dbData = "";
        if (message.equalsIgnoreCase("hello") || message.equalsIgnoreCase("chào shop") || 
            message.equalsIgnoreCase("shop ơi") || message.equalsIgnoreCase("shop") || message.contains("cho mình hỏi")) {
            reply = "Chào bạn! Rất vui được trò chuyện với bạn. Mình là chatbot của Ligma Shop, sẵn sàng giúp bạn với các câu hỏi về sản phẩm. Bạn khỏe không? Có gì thú vị đang xảy ra không?";
            out.print(reply);
            return;
        } else if (message.contains("cảm ơn shop") || message.contains("thanks")) {
            reply = "Không có gì đâu bạn! Ligma Shop luôn sẵn lòng hỗ trợ bạn. Bạn cần giúp gì thêm không?";
            out.print(reply);
            return;
        }
        // Truy vấn database dựa trên tin nhắn
        if (message.contains("giá") || message.contains("bao nhiêu")) {
            dbData = getPriceFromDB(conn, productName);
        } else if (message.contains("kích cỡ") || message.contains("size")) {
            dbData = getSizesFromDB(conn, productName);
        } else if (message.contains("màu") || message.contains("color")) {
            dbData = getColorsFromDB(conn, productName);
        } else if (message.contains("có") && message.contains("không")) {
            dbData = checkAvailabilityWithSizeAndColor(conn, productName, size, color);
        } else if (message.contains("giảm") || message.contains("discount")) {
            dbData = getDiscountFromDB(conn, productName);
        } else if (message.contains("đánh giá") || message.contains("rating")) {
            dbData = getRatingFromDB(conn, productName);
        } else if (message.contains("tất cả sản phẩm")) {
            dbData = getAllProducts(conn);
        } else if (message.contains("danh mục") || message.contains("category") || message.contains("loại")) {
            String categoryName = extractCategoryName(message);
            dbData = getProductsByCategory(conn, categoryName);
        } else if (message.contains("áo") && message.contains("nam")) {
            dbData = getProductsByCategory(conn, "Áo Nam");
        } else if (message.contains("quần") && message.contains("nữ")) {
            dbData = getProductsByCategory(conn, "Quần Nữ");
        } else if (message.contains("áo") && message.contains("nữ")) {
            dbData = getProductsByCategory(conn, "Áo Nữ");
        } else if (message.contains("quần") && message.contains("nam")) {
            dbData = getProductsByCategory(conn, "Quần Nam");
        } else if ((message.contains("áo quần") || message.contains("quần áo")) && message.contains("nam")) {
            dbData = getProductsByCategory(conn, "Quần áo Nam");
        } else if ((message.contains("áo quần") || message.contains("quần áo")) && message.contains("nữ")) {
            dbData = getProductsByCategory(conn, "Quần áo Nữ");
        } else if (message.contains("áo khoác")) {
            dbData = getProductsByCategory(conn, "Áo khoác");
        } else if (message.contains("đầm")) {
            dbData = getProductsByCategory(conn, "Đầm");
        } else if (message.contains("đồ thể thao")) {
            dbData = getProductsByCategory(conn, "Đồ thể thao");
        } else if (message.contains("thời trang mùa đông") || message.contains("đông") || message.contains("mùa đông") || message.contains("lạnh")) {
            dbData = getProductsByCategory(conn, "Thời trang mùa đông");
        } else if (message.contains("thời trang mùa hè") || message.contains("mùa hè") || message.contains("hè") || message.contains("nóng")) {
            dbData = getProductsByCategory(conn, "Thời trang mùa hè");
        }

        // Kiểm tra nếu có dữ liệu từ DB thì gửi cho Grok, nếu không thì trả thông báo mặc định
        if (!dbData.isEmpty()) {
            reply = callGrokWithDB(message, dbData);
        } else {
            reply = "Bạn là chatbot hỗ trợ mua sắm của Ligma Shop. Giúp người dùng với các câu hỏi về sản phẩm. Trả lời thân thiện và chính xác.\nMình chưa hiểu câu hỏi của bạn lắm, bạn có thể hỏi về sản phẩm không?";
        }
    } catch (SQLException e) {
        reply = "❌ Lỗi kết nối: " + e.getMessage();
        e.printStackTrace();
    }

    out.print(reply);
}

private String callGrokWithDB(String message, String dbData) {
    try {
        URL url = new URL(API_URL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Authorization", "Bearer " + XAI_API_KEY);
        conn.setDoOutput(true);

        String systemContent = "Bạn là chatbot hỗ trợ mua sắm của Ligma Shop. Chỉ trả lời dựa trên dữ liệu từ database được cung cấp dưới đây và không tự ý trả lời các câu hỏi ngoài phạm vi sản phẩm, tài khoản, giao hàng, hoặc hỗ trợ khách hàng. Giữ định dạng danh sách sản phẩm với dấu gạch ngang (-) và xuống dòng cho mỗi mục:\n" + escapeJson(dbData);

        String jsonInput = "{\"model\": \\\"deepseek/deepseek-chat:free\", \"messages\": ["
                + "{\"role\": \"system\", \"content\": \"" + escapeJson(systemContent) + "\"},"
                + "{\"role\": \"user\", \"content\": \"" + escapeJson(message) + "\"}"
                + "]}";

        System.out.println("jsonInput gửi đi: " + jsonInput);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonInput.getBytes("UTF-8"));
            os.flush();
        }

        int responseCode = conn.getResponseCode();
        System.out.println("Mã phản hồi: " + responseCode);
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String response = br.lines().collect(Collectors.joining());
            conn.disconnect();

            JSONObject json = new JSONObject(response);
            JSONArray choices = json.getJSONArray("choices");
            if (choices.length() > 0) {
                JSONObject choice = choices.getJSONObject(0);
                JSONObject messageObj = choice.getJSONObject("message");
                return messageObj.getString("content");
            }
            return "Không nhận được phản hồi từ API.";
        } else {
            return "Lỗi API: Mã phản hồi " + responseCode;
        }
    } catch (Exception e) {
        e.printStackTrace();
        return "Lỗi: " + e.getMessage();
    }
}

// Hàm thoát ký tự JSON
private String escapeJson(String input) {
    if (input == null) return "";
    return input.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
}

    // Các hàm hỗ trợ giữ nguyên (extractProductName, extractSize, extractColor, extractCategoryName)
    // và các hàm truy vấn cơ sở dữ liệu (getPriceFromDB, getSizesFromDB, v.v.) không thay đổi
    // Dán lại các hàm này từ mã gốc của bạn nếu cần thiết
    // Hàm trích xuất tên sản phẩm
    private String extractProductName(String message) {
        String[] keywords = {"giá", "bao nhiêu", "kích cỡ", "size", "màu", "color", "có", "không",
            "giảm", "discount", "đánh giá", "rating", "thế nào", "những nào", "gì",
            "sản phẩm", "những", "\\?", "nào", "và", "là", "danh mục", "category",
            "trong", "loại", "bán","như thế nào","muốn","mua"};
        String productName = message;

        // Loại bỏ từ khóa
        for (String keyword : keywords) {
            productName = productName.replaceAll(keyword, "").trim();
        }

        // Loại bỏ kích cỡ và màu sắc đã trích xuất
        String size = extractSize(message);
        String color = extractColor(message);
        if (size != null) {
            productName = productName.replaceAll("(?i)" + size, "").trim();
        }
        if (color != null) {
            productName = productName.replaceAll("(?i)" + color, "").trim();
        }

        return productName;
    }

    // Hàm trích xuất kích cỡ
    private String extractSize(String message) {
        String[] sizeKeywords = {"size", "kích cỡ", "kich co"};
        String[] sizes = {"xxl", "xl", "l", "XXL", "XL", "L"}; // Có thể mở rộng thêm
        for (String keyword : sizeKeywords) {
            if (message.contains(keyword)) {
                for (String size : sizes) {
                    if (message.contains(size)) {
                        return size.toUpperCase(); // Chuẩn hóa thành XXL, XL, v.v.
                    }
                }
            }
        }
        // Kiểm tra trực tiếp nếu không có từ khóa "size/kích cỡ"
        for (String size : sizes) {
            if (message.contains(size)) {
                return size.toUpperCase();
            }
        }
        return null; // Không tìm thấy size
    }

    // Hàm trích xuất màu sắc
    private String extractColor(String message) {
        String[] colorKeywords = {"màu", "mau", "color"};
        String[] colors = {"đen", "trắng", "xanh",
            "den", "trang", "blue", "Đen", "Trắng", "Blue"};
        for (String keyword : colorKeywords) {
            if (message.contains(keyword)) {
                for (String color : colors) {
                    if (message.contains(color)) {
                        switch (color) {
                            case "den":
                                return "đen";
                            case "trang":
                                return "trắng";
                            case "blue":
                                return "xanh";

                            default:
                                return color;
                        }
                    }
                }
            }
        }
        // Kiểm tra trực tiếp nếu không có từ khóa "màu/color"
        for (String color : colors) {
            if (message.contains(color)) {
                switch (color) {
                    case "den":
                        return "đen";
                    case "trang":
                        return "trắng";
                    case "blue":
                        return "xanh";

                    default:
                        return color;
                }
            }
        }
        return null; // Không tìm thấy màu
    }

    // Hàm trích xuất danh mục
    private String extractCategoryName(String message) {
        String[] keywords = {"danh mục", "category", "trong", "có", "gì", "nào", "\\?", "của", "các", "loại", "mà", "shop", "bán"};
        String categoryName = message;
        for (String keyword : keywords) {
            categoryName = categoryName.replaceAll(keyword, "").trim();
        }
        return categoryName;
    }

    // Hàm kiểm tra giá
    public String getPriceFromDB(Connection conn, String productName) throws SQLException {
        String sql = "SELECT ProductName, Price, Discount FROM PRODUCTS WHERE ProductName LIKE N'%' + ? + N'%' AND Status = 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, productName);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    double price = rs.getDouble("Price");
                    int discount = rs.getInt("Discount");
                    double finalPrice = price * (1 - discount / 100.0);
                    return "🛍️ Sản phẩm '" + rs.getString("ProductName") + "' có giá " + finalPrice + " VNĐ.(đã giảm giá)";
                }
                return "⚠️ Không tìm thấy sản phẩm '" + productName + "'.";
            }
        }
    }

    // Hàm kiểm tra kích cỡ
    public String getSizesFromDB(Connection conn, String productName) throws SQLException {
        String sql = "SELECT DISTINCT s.SizeName FROM SIZES s "
                + "JOIN PRODUCTSIZECOLOR psc ON s.SizeID = psc.SizeID "
                + "JOIN PRODUCTS p ON psc.ProductID = p.ProductID "
                + "WHERE p.ProductName LIKE N'%' + ? + N'%' AND p.Status = 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, productName);
            try (ResultSet rs = stmt.executeQuery()) {
                StringBuilder sizes = new StringBuilder();
                while (rs.next()) {
                    sizes.append(rs.getString("SizeName")).append(", ");
                }
                if (sizes.length() > 0) {
                    sizes.setLength(sizes.length() - 2);
                    return "📏 Sản phẩm có các kích cỡ: " + sizes.toString() + ".";
                }
                return "⚠️ Không tìm thấy kích cỡ cho '" + productName + "'.";
            }
        }
    }

    // Hàm kiểm tra màu sắc
    public String getColorsFromDB(Connection conn, String productName) throws SQLException {
        String sql = "SELECT DISTINCT c.ColorName FROM COLORS c "
                + "JOIN PRODUCTSIZECOLOR psc ON c.ColorID = psc.ColorID "
                + "JOIN PRODUCTS p ON psc.ProductID = p.ProductID "
                + "WHERE p.ProductName LIKE N'%' + ? + N'%' AND p.Status = 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, productName);
            try (ResultSet rs = stmt.executeQuery()) {
                StringBuilder colors = new StringBuilder();
                while (rs.next()) {
                    colors.append(rs.getString("ColorName")).append(", ");
                }
                if (colors.length() > 0) {
                    colors.setLength(colors.length() - 2);
                    return "🎨 Sản phẩm có các màu: " + colors.toString() + ".";
                }
                return "⚠️ Không tìm thấy màu cho '" + productName + "'.";
            }
        }
    }

    // Hàm kiểm tra sự tồn tại (không có size và color)
    public String checkAvailability(Connection conn, String productName) throws SQLException {
        String checkExistsSql = "SELECT ProductName, Status FROM PRODUCTS WHERE ProductName LIKE N'%' + ? + N'%'";
        try (PreparedStatement stmt = conn.prepareStatement(checkExistsSql)) {
            stmt.setString(1, productName);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int status = rs.getInt("Status");
                    String foundProductName = rs.getString("ProductName");
                    if (status == 1) {
                        return "✅ Sản phẩm '" + foundProductName + "' có sẵn!";
                    } else {
                        return "❌ Sản phẩm '" + foundProductName + "' đã hết hàng.";
                    }
                } else {
                    return "⚠️ Không tìm thấy sản phẩm '" + productName + "'.";
                }
            }
        }
    }

    public String checkAvailabilityWithSizeAndColor(Connection conn, String productName, String size, String color) throws SQLException {
        if (productName == null || productName.trim().isEmpty()) {
            return "❌ Tên sản phẩm không hợp lệ!";
        }

        StringBuilder sql = new StringBuilder(
                "SELECT p.ProductName, p.Price, s.SizeName, c.ColorName "
                + "FROM PRODUCTS p "
                + "INNER JOIN PRODUCTSIZECOLOR psc ON p.ProductID = psc.ProductID "
                + "INNER JOIN SIZES s ON psc.SizeID = s.SizeID "
                + "INNER JOIN COLORS c ON psc.ColorID = c.ColorID "
                + "WHERE p.ProductName LIKE N'%' + ? + N'%' AND p.Status = 1"
        );
        if (size != null) {
            sql.append(" AND UPPER(TRIM(s.SizeName)) = UPPER(?)");
        }
        if (color != null) {
            sql.append(" AND UPPER(TRIM(c.ColorName)) = UPPER(?)");
        }
        System.out.println("SQL Template: " + sql.toString());

        try (PreparedStatement stmt = conn.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            String cleanProductName = productName.replaceAll("[�?]", "").trim();

            stmt.setString(paramIndex++, cleanProductName);
            if (size != null) {
                stmt.setNString(paramIndex++, size.trim());
            }
            if (color != null) {
                String cleanColor = color.replaceAll("[�?]", "").trim();
                stmt.setNString(paramIndex++, cleanColor);
            }

            try (ResultSet rs = stmt.executeQuery()) {
                boolean hasData = rs.next();
                System.out.println("ResultSet has data: " + hasData);
                if (hasData) {
                    String foundProduct = rs.getString("ProductName");
                    System.out.println("Found product: " + foundProduct);
                    double basePrice = rs.getDouble("Price"); // Giá cơ bản từ DB
                    double adjustedPrice = basePrice; // Giá sẽ được điều chỉnh

                    // Điều chỉnh giá dựa trên kích cỡ
                    if (size != null) {
                        if (size.equalsIgnoreCase("XL")) {
                            adjustedPrice = basePrice + 50000; // XL = X + 50,000
                        } else if (size.equalsIgnoreCase("XXL")) {
                            adjustedPrice = basePrice + 80000; // XXL = X + 80,000
                        }
                    }

                    StringBuilder response = new StringBuilder("✅ Sản phẩm '" + foundProduct + "' ");
                    if (size != null) {
                        response.append("size " + rs.getString("SizeName") + " ");
                    }
                    if (color != null) {
                        response.append("màu " + rs.getString("ColorName") + " ");
                    }
                    response.append("có sẵn với giá " + adjustedPrice + " VNĐ!");
                    return response.toString();
                } else {
                    StringBuilder response = new StringBuilder("❌ Sản phẩm '" + cleanProductName + "' ");
                    if (size != null) {
                        response.append("size " + size + " ");
                    }
                    if (color != null) {
                        response.append("màu " + color + " ");
                    }
                    response.append("hiện không có sẵn hoặc không tồn tại.");
                    return response.toString();
                }
            }
        }
    }

    // Hàm kiểm tra giảm giá
    public String getDiscountFromDB(Connection conn, String productName) throws SQLException {
        String sql = "SELECT ProductName, Discount FROM PRODUCTS WHERE ProductName LIKE N'%' + ? + N'%' AND Status = 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, productName);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int discount = rs.getInt("Discount");
                    return "💰 Sản phẩm '" + rs.getString("ProductName") + "' có giảm giá " + discount + "%.";
                }
                return "⚠️ Sản phẩm '" + productName + "' không có giảm giá.";
            }
        }
    }

    // Hàm tìm kiếm sản phẩm
    public String searchProduct(Connection conn, String keyword) throws SQLException {
        String sql = "SELECT ProductName FROM PRODUCTS WHERE ProductName LIKE N'%' + ? + N'%' AND Status = 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, keyword);
            try (ResultSet rs = stmt.executeQuery()) {
                StringBuilder results = new StringBuilder("🔎 Kết quả tìm kiếm: ");
                while (rs.next()) {
                    results.append("_ ").append(rs.getString("ProductName")).append("\n");
                }
                if (results.length() > 17) {
                    results.setLength(results.length() - 2);
                    return results.toString();
                }
                return "⚠️ Không tìm thấy sản phẩm phù hợp với '" + keyword + "'.";
            }
        }
    }

    // Hàm kiểm tra đánh giá
    public String getRatingFromDB(Connection conn, String productName) throws SQLException {
        String sql = "SELECT ProductName, AVG(r.Rating) AS AvgRating FROM REVIEWS r "
                + "JOIN PRODUCTS p ON r.ProductID = p.ProductID "
                + "WHERE p.ProductName LIKE N'%' + ? + N'%' AND p.Status = 1 "
                + "GROUP BY p.ProductName";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, productName);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    double avgRating = rs.getDouble("AvgRating");
                    return "⭐ Sản phẩm '" + rs.getString("ProductName") + "' có đánh giá trung bình: " + avgRating + "⭐.";
                }
                return "⚠️ Sản phẩm '" + productName + "' chưa có đánh giá.";
            }
        }
    }

    // Hàm lấy sản phẩm theo danh mục
    public String getProductsByCategory(Connection conn, String categoryName) throws SQLException {
        String sql = "SELECT p.ProductName "
                + "FROM PRODUCTS p "
                + "JOIN ProductCategories pc ON p.ProductID = pc.ProductID "
                + "JOIN CATEGORIES c ON pc.CategoryID = c.CategoryID "
                + "WHERE c.CategoryName LIKE N'%' + ? + N'%' AND p.Status = 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, categoryName);
            try (ResultSet rs = stmt.executeQuery()) {
                StringBuilder products = new StringBuilder("🛒 Sản phẩm trong danh mục '" + categoryName + "': ");
                boolean hasProducts = false;
                while (rs.next()) {
                    products.append("_ ").append(rs.getString("ProductName")).append("\n");
                    hasProducts = true;
                }
                if (hasProducts) {
                    products.setLength(products.length() - 2);
                    return products.toString();
                }
                return "⚠️ Không tìm thấy sản phẩm nào trong danh mục '" + categoryName + "'.";
            }
        }
    }

    // Hàm lấy tất cả sản phẩm
    public String getAllProducts(Connection conn) throws SQLException {
        String sql = "SELECT p.ProductName "
                + "FROM PRODUCTS p "
                + "JOIN ProductCategories pc ON p.ProductID = pc.ProductID "
                + "JOIN CATEGORIES c ON pc.CategoryID = c.CategoryID "
                + "WHERE p.Status = 1 "
                + "ORDER BY p.ProductName";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                StringBuilder products = new StringBuilder("🛒 Tất cả sản phẩm mà shop bán: ");
                boolean hasProducts = false;
                while (rs.next()) {
                    products.append(rs.getString("ProductName")).append(", ");
                    hasProducts = true;
                }
                if (hasProducts) {
                    products.setLength(products.length() - 2);
                    return products.toString();
                }
                return "⚠️ Hiện tại shop không có sản phẩm nào.";
            }
        }
    }
}
>>>>>>> 0504289d8f046b30ba61e49c04d7b09aec36d9d7
