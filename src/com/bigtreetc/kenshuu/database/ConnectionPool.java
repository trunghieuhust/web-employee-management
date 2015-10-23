package com.bigtreetc.kenshuu.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public abstract class ConnectionPool {
    private static DatabaseManager databaseManager = new OracleDatabaseManager();
    private static Vector<Connection> pool = new Vector<Connection>();
    private static int MAX_CONNECTION_IN_POOL = 50;
    private static int INIT_CONNECTION_IN_POOL = 5;

    public static Connection getConnection() {
        Connection conn = null;
        if (isPoolEmpty() == true) {
            initPool();
        }
        synchronized (databaseManager) {
            conn = getNext();
        }
        return conn;
    }

    public static void initPool() {
        synchronized (databaseManager) {
            if (pool.size() < (pool.size() + INIT_CONNECTION_IN_POOL)) {
                for (int i = 0; i < INIT_CONNECTION_IN_POOL; i++) {
                    insertToPool(databaseManager.createConnection());
                }
            }
        }
    }

    public static void release(Connection conn) {
        if (conn == null) {
            return;
        }
        if (isPoolFull()) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        insertToPool(conn);
    }

    public static void release(Connection conn, Statement statement) {
        release(conn);
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void release(Connection conn, Statement statement,
            ResultSet resultSet) {
        release(conn, statement);
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void insertToPool(Connection conn) {
        synchronized (pool) {
            if (isPoolFull() == false && conn != null) {
                pool.add(conn);
            }
        }
    }

    private static Connection getNext() {
        if (pool.size() == 0) {
            return null;
        } else {
            return pool.remove(pool.size() - 1);
        }
    }

    private static boolean isPoolFull() {
        if (pool != null && pool.size() == MAX_CONNECTION_IN_POOL) {
            return true;
        } else {
            return false;
        }
    }

    private static boolean isPoolEmpty() {
        if (pool != null && pool.size() == 0) {
            return true;
        } else {
            return false;
        }
    }
}
