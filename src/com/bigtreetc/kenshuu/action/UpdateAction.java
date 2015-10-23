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

public class UpdateAction extends Action {
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

        // empIdフィールドが見つからない場合
        String empId = request.getParameter("empId");
        if (empId == null || empId.length() == 0) {
            ActionMessages errors = new ActionMessages();
            errors.add("id_field_not_found", new ActionMessage("id_field_not_found",
                    "errors.id_field_not_found"));
            saveErrors(request, errors);
            return mapping.findForward("error");
        }

        UserDAO userDAO = DAOFactory.getDAOFactory(DAOFactory.ORACLE).getUserDAO();

        UserBean userBean = userDAO.searchByID(Integer.parseInt(empId));
//        request.setAttribute("userBean", userBean);
        request.setAttribute("empId", empId);

        return mapping.findForward("update");
    }
}
