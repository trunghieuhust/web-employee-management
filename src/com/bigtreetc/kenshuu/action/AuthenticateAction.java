package com.bigtreetc.kenshuu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.bigtreetc.kenshuu.bean.UserBean;
import com.bigtreetc.kenshuu.dao.DAOFactory;
import com.bigtreetc.kenshuu.dao.UserDAO;
import com.bigtreetc.kenshuu.form.LoginForm;

public class AuthenticateAction extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        if (request.getSession().getAttribute("current_user") != null) {
            System.out.println("already login.");
            return mapping.findForward("success");
        }
        System.out.println("logging in.");
        LoginForm loginForm = (LoginForm) form;

        String empId = loginForm.getId();
        String password = loginForm.getPassword();

        DAOFactory daoFactory = DAOFactory.getDAOFactory(DAOFactory.ORACLE);
        UserDAO userDAO = daoFactory.getUserDAO();

        UserBean userBean = userDAO.searchByID(Integer.parseInt(empId));
        if (userBean == null || !password.equals(userBean.getEmpPass())) {
            // パスワードとIDが間違いました。エラーを表示します。
            ActionMessages actionMessages = new ActionMessages();
            actionMessages.add("failed", new ActionMessage(
                    "errors.login_failed", ""));
            System.out.println(userBean.getEmpPass());
            saveErrors(request, actionMessages);
            return mapping.findForward("failed");
        } else {
            request.getSession().setAttribute("current_user", userBean);
            return mapping.findForward("success");
        }
    }
}
