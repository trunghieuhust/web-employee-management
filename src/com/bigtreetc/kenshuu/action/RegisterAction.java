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

public class RegisterAction extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse httpservletresponse) {
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

        // 更新の場合、EmpId属性が指定します。
        System.out.println("register action: " + registerForm.getEmpId());
        userBean.setEmpId(registerForm.getEmpId());

        PostBean postBean = new PostBean();
        postBean.setPostId(registerForm.getDeptId());
        postBean.setPostName(userDAO.getDeptNameByID(registerForm.getDeptId()));
        userBean.setPostBean(postBean);

        request.setAttribute("userBean", userBean);
        request.setAttribute("postBean", postBean);
        request.setAttribute("deptId", userBean.getPostBean().getPostId());

        return mapping.findForward("confirm");
    }
}
