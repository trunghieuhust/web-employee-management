package com.bigtreetc.kenshuu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class LogoutAction extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse httpservletresponse)
            throws Exception {
        request.getSession().removeAttribute("current_user");
        if (request.getSession().getAttribute("current_user") == null) {
            System.out.println("logged out.");
        }
        return mapping.findForward("success");
    }
}
