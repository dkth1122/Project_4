package com.example.project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project.dao.GBoardService;
import com.example.project.model.GBoard;
import com.google.gson.Gson;

@Controller
public class GBoardController {
	
	@Autowired
	GBoardService gboardService;
	
	@RequestMapping("/gboard/main.do") 
    public String mainGBoard(Model model) throws Exception{

        return "/GBoard/01main/gboard_Main_01";
    }
	
	@RequestMapping("/gboard/bts.do") 
    public String memberBoard1(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_01_BTS";
    }
	@RequestMapping("/gboard/tbt.do") 
    public String memberBoard2(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_02_TBT";
    }
	@RequestMapping("/gboard/ehp.do") 
    public String memberBoard3(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_03_EHP";
    }
	@RequestMapping("/gboard/svt.do") 
    public String memberBoard4(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_04_SVT";
    }
	@RequestMapping("/gboard/pm9.do") 
    public String memberBoard5(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_05_PM9";
    }
	@RequestMapping("/gboard/lsp.do") 
    public String memberBoard6(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_06_LSP";
    }
	@RequestMapping("/gboard/njs.do") 
    public String memberBoard7(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_07_NJS";
    }
	@RequestMapping("/gboard/bnd.do") 
    public String memberBoard8(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_08_BND";
    }
	@RequestMapping("/gboard/jico.do") 
    public String memberBoard9(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_09_JICO";
    }
	
	
	
	@RequestMapping(value = "/gboard/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String select(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GBoard> list = gboardService.searchGBoardList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/gboard/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		  gboardService.addGBoard(map);
	      return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/gboard/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		  gboardService.removeGBoard(map);
	      return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/gboard/search.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GBoard> info = gboardService.searchGBoardInfo(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
}
