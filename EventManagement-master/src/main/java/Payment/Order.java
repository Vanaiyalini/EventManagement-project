package Payment;

public class Order {
    private String fullName;
    private String email;
    private String address;
    private String cardName;
    private String cardNumber;
    private String cvv;

    // Constructor
    public Order(String fullName, String email, String address, String cardName, String cardNumber, String cvv) {
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.cardName = cardName;
        this.cardNumber = cardNumber;
        this.cvv = cvv;
    }

    public Order() {
        // Default constructor
    }

    // Getters and Setters
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }
}
