package com.bigtreetc.kenshuu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.bigtreetc.kenshuu.bean.PostBean;
import com.bigtreetc.kenshuu.bean.UserBean;
import com.bigtreetc.kenshuu.dao.DAOFactory;
import com.bigtreetc.kenshuu.dao.UserDAO;
import com.bigtreetc.kenshuu.form.RegisterForm;

public class RegisterAction extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse httpservletresponse) {
        // ログインチェック
        if (request.getSession().getAttribute("current_user") == null) {
            ActionMessages errors = new ActionMessages();
            errors.add("login_required", new ActionMessage("login_required", "errors.login_required"));
            saveErrors(request, errors);
            return mapping.findForward("login");
        }
        UserBean current_user = (UserBean) request.getSession().getAttribute("current_user");
        if (current_user.getAuthority() != UserBean.ADMIN) {
            ActionMessages errors = new ActionMessages();
            errors.add("permission_denied", new ActionMessage("permission_denied", "errors.permission_denied"));
            saveErrors(request, errors);
            request.getSession().removeAttribute("current_user");
            return mapping.findForward("login");
        }
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
