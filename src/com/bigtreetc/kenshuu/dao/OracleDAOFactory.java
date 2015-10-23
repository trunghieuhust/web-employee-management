package com.bigtreetc.kenshuu.dao;


public class OracleDAOFactory extends DAOFactory {
    @Override
    public UserDAO getUserDAO() {
        return new OracleUserDAO();
    }

}
