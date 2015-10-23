package com.bigtreetc.kenshuu.dao;

public abstract class DAOFactory {
    public static final int ORACLE = 1;

    public abstract UserDAO getUserDAO();

    public static DAOFactory getDAOFactory(int whichFactory) {
        switch (whichFactory) {
        case ORACLE:
            return new OracleDAOFactory();

        default:
            return null;
        }
    }
}
