package p3;

import java.io.IOException;
import java.net.SocketException;
import java.sql.SQLException;

class Test{
    void method1() throws SQLException, IOException {

    }
}

class SubTest extends Test{
    @Override
    void method1() throws SQLException {
//        throw new SQLException(new SocketException());
        throw new SQLException(new CloneNotSupportedException()); // Exception Chaining
        }
}
public class Program01 {
}
