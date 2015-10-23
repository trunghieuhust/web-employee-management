package com.bigtreetc.kenshuu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.bigtreetc.kenshuu.bean.PostBean;
import com.bigtreetc.kenshuu.bean.UserBean;
import com.bigtreetc.kenshuu.dao.DAOFactory;
import com.bigtreetc.kenshuu.dao.UserDAO;
import com.bigtreetc.kenshuu.form.RegisterForm;

public class ConfirmAction extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse httpservletresponse)
            throws Exception {
        DAOFactory daoFactory = DAOFactory.getDAOFactory(DAOFactory.ORACLE);
        UserDAO userDAO = daoFactory.getUserDAO();
        RegisterForm registerForm = (RegisterForm) form;

        UserBean userBean = new UserBean();

        userBean.setAddress(registerForm.getAddress());
        userBean.setAuthority(registerForm.getAuthority());
        userBean.setBirthday(registerForm.getBirthday());
        userBean.setEmpName(registerForm.getEmpName());
        userBean.setEmpPass(registerForm.getEmpPass());
        userBean.setGender(registerForm.getGender());
        PostBean postBean = new PostBean();
        postBean.setPostId(registerForm.getDeptId());
        userBean.setPostBean(postBean);

        System.out.println(request.getAttribute("empId"));
//        userDAO.insertNewEmployee(userBean);
        return mapping.findForward("success");
    }
}
