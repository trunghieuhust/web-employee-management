package com.bigtreetc.kenshuu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.bigtreetc.kenshuu.form.DeleteForm;

public class ConfirmDeleteAction extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // String empId = request.getParameter("empId");
        DeleteForm deleteForm = (DeleteForm) form;
        int empId = deleteForm.getEmpId();
        // System.out.println(empId);

        request.setAttribute("empId", empId);
        return mapping.findForward("delete");
    }
}
