package com.toptr.website.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.toptr.website.dao.ClientInfoDAO;
import com.toptr.website.pojo.ClientInfo;
import com.toptr.website.service.ClientInfoFormValidator;

@Controller
public class ClientInfoControllers
{
    @Autowired
    private ClientInfoDAO clientInfoDAO;
    
    @Autowired
    private ClientInfoFormValidator validator;
        
    @InitBinder
    public void initBinder(WebDataBinder binder)
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
        
    @RequestMapping("/searchClientInfo")
    public ModelAndView searchClientInfo(@RequestParam(required= false, defaultValue="") String clientname)
    {
        ModelAndView mav = new ModelAndView("showClientInfo");
        List<ClientInfo> clientInfo = clientInfoDAO.searchClientInfo(clientname.trim());
        mav.addObject("SEARCH_CLIENTINFO_RESULTS_KEY", clientInfo);
        return mav;
    }
    
    @RequestMapping("/viewAllClientInfo")
    public ModelAndView getAllClientInfo()
    {
        ModelAndView mav = new ModelAndView("showClientInfo");
        List<ClientInfo> clientInfo = clientInfoDAO.getAllClientInfo();
        mav.addObject("SEARCH_CLIENTINFO_RESULTS_KEY", clientInfo);
        return mav;
    }
    
    @RequestMapping(value="/saveClientInfo", method=RequestMethod.GET)
    public ModelAndView newuserForm()
    {
        ModelAndView mav = new ModelAndView("newClientInfo");
        ClientInfo clientInfo = new ClientInfo();
        mav.getModelMap().put("newClientInfo", clientInfo);
        return mav;
    }
    
    @RequestMapping(value="/saveClientInfo", method=RequestMethod.POST)
    public String create(@ModelAttribute("newClientInfo")ClientInfo clientInfo, BindingResult result, SessionStatus status)
    {
        validator.validate(clientInfo, result);
        if (result.hasErrors())
        {                
            return "newClientInfo";
        }
        clientInfoDAO.save(clientInfo);
        status.setComplete();
        return "redirect:viewAllClientInfo.do";
    }
    
    @RequestMapping(value="/updateClientInfo", method=RequestMethod.GET)
    public ModelAndView edit(@RequestParam("id")Integer id)
    {
        ModelAndView mav = new ModelAndView("editClientInfo");
        ClientInfo clientInfo = clientInfoDAO.getById(id);
        mav.addObject("editClientInfo", clientInfo);
        return mav;
    }
    
    @RequestMapping(value="/updateClientInfo", method=RequestMethod.POST)
    public String update(@ModelAttribute("editClientInfo") ClientInfo clientInfo, BindingResult result, SessionStatus status)
    {
        validator.validate(clientInfo, result);
        if (result.hasErrors()) {
            return "editClientInfo";
        }
        clientInfoDAO.update(clientInfo);
        status.setComplete();
        return "redirect:viewAllClientInfo.do";
    }
        
    @RequestMapping("deleteClientInfo")
    public ModelAndView delete(@RequestParam("id")Integer id)
    {
        ModelAndView mav = new ModelAndView("redirect:viewAllClientInfo.do");
        clientInfoDAO.delete(id);
        return mav;
    }    
}

