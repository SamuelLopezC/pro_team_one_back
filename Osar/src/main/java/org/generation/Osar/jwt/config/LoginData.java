package org.generation.Osar.jwt.config;

public class LoginData {
    public class loginData {
        private final String username;
        private final String password;

        public loginData(String username, String password) {
            this.username = username;
            this.password = password;
        }//constructor

        public String getUsername() {
            return username;
        }//getusername

        public String getPassword() {
            return password;
        }//getpassword
    }//loginData

}//login
