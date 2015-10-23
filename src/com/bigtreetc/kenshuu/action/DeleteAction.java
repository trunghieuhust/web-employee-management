package com.bigtreetc.kenshuu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.bigtreetc.kenshuu.dao.DAOFactory;
import com.bigtreetc.kenshuu.dao.UserDAO;
import com.bigtreetc.kenshuu.form.DeleteForm;

public class DeleteAction extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        DeleteForm deleteForm = (DeleteForm) form;

        UserDAO userDAO = DAOFactory.getDAOFactory(DAOFactory.ORACLE)
                .getUserDAO();

        int result = userDAO.deleteEmployee(deleteForm.getEmpId());

        request.setAttribute("result", result);
        return mapping.findForward("result");
    }

}
