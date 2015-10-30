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

public class ConfirmAction extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse httpservletresponse)
            throws Exception {
        // ログインチェック
        if (request.getSession().getAttribute("current_user") == null) {
            ActionMessages errors = new ActionMessages();
            errors.add("login_required", new ActionMessage("login_required", "errors.login_required"));
            saveErrors(request, errors);
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
        PostBean postBean = new PostBean();
        postBean.setPostId(registerForm.getDeptId());
        userBean.setPostBean(postBean);

        int result = 0;
        System.out.println(registerForm.getEmpId());
        if (registerForm.getEmpId() == 0) {
            // 社員情報登録の場合
            if (((UserBean) request.getSession().getAttribute("current_user"))
                    .getAuthority() != UserBean.ADMIN) {
                ActionMessages errors = new ActionMessages();
                errors.add("permission_denied", new ActionMessage(
                        "permission_denied", "errors.permission_denied"));
                saveErrors(request, errors);
                return mapping.findForward("error");
            }
            result = userDAO.insertNewEmployee(userBean);
        } else {
            // 社員情報更新の場合
            userBean.setEmpId(registerForm.getEmpId());
            result = userDAO.updateEmployee(userBean);
            System.out.println(userBean.getAuthority());
            request.setAttribute("empId", registerForm.getEmpId());
        }
        request.setAttribute("result", result);
        return mapping.findForward("success");
    }

}
