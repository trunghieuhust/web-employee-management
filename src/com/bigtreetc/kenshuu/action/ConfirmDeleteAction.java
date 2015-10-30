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
import com.bigtreetc.kenshuu.form.DeleteForm;

public class ConfirmDeleteAction extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // ログインしない場合、ログイン画面が移動されます
        if (request.getSession().getAttribute("current_user") == null) {
            ActionMessages errors = new ActionMessages();
            errors.add("login_required", new ActionMessage("login_required",
                    "errors.login_required"));
            saveErrors(request, errors);
            return mapping.findForward("login");
        }

        if (((UserBean) request.getSession().getAttribute("current_user"))
                .getAuthority() != UserBean.ADMIN) {
            ActionMessages errors = new ActionMessages();
            errors.add("permission_denied", new ActionMessage(
                    "permission_denied", "errors.permission_denied"));
            saveErrors(request, errors);
            return mapping.findForward("error");
        }

        DeleteForm deleteForm = (DeleteForm) form;
        int empId = deleteForm.getEmpId();

        request.setAttribute("empId", empId);
        return mapping.findForward("delete");
    }
}
