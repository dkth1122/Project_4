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
	
	//메인 페이지
	// 멤버쉽 구독한 아티스트의 버튼만 보이도록 수정 예정
	@RequestMapping("/gboard/main.do") 
    public String mainGBoard(Model model) throws Exception{

        return "/GBoard/01main/gboard_Main_01";
    }
	
	//BTS 아티스트 페이지 
	@RequestMapping("/gboard/bts.do") 
    public String memberBoard1(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_01_BTS";
    }
	
	//투모로우바이투게더 아티스트 페이지
	@RequestMapping("/gboard/txt.do") 
    public String memberBoard2(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_02_TXT";
    }
	
	//엔하이픈 아티스트 페이지
	@RequestMapping("/gboard/ehp.do") 
    public String memberBoard3(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_03_EHP";
    }
	
	//세븐틴 아티스트 페이지
	@RequestMapping("/gboard/svt.do") 
    public String memberBoard4(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_04_SVT";
    }
	
	//프로미스나인 아티스트 페이지
	@RequestMapping("/gboard/pm9.do") 
    public String memberBoard5(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_05_PM9";
    }
	
	//르세라핌 아티스트 페이지
	@RequestMapping("/gboard/lsp.do") 
    public String memberBoard6(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_06_LSP";
    }
	
	//뉴진스 아티스트 페이지
	@RequestMapping("/gboard/njs.do") 
    public String memberBoard7(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_07_NJS";
    }
	
	//보이넥스트도어 아티스트 페이지
	@RequestMapping("/gboard/bnd.do") 
    public String memberBoard8(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_08_BND";
    }
	
	//지코 아티스트 페이지
	@RequestMapping("/gboard/jico.do") 
    public String memberBoard9(Model model) throws Exception{

        return "/GBoard/02artistMain/Main_09_JICO";
    }
	
	
	
	//게시글 전체 조회 기능
	@RequestMapping(value = "/gboard/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String select(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GBoard> list = gboardService.searchGBoardList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//게시글 전체 조회 기능
	@RequestMapping(value = "/gboard/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		  gboardService.addGBoard(map);
	      return new Gson().toJson(resultMap);
	}
	
	//게시글 삭제 기능
	@RequestMapping(value = "/gboard/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		  gboardService.removeGBoard(map);
	      return new Gson().toJson(resultMap);
	}
	
	//게시글 검색 기능
	@RequestMapping(value = "/gboard/search.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GBoard> info = gboardService.searchGBoardInfo(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	
    // 게시글 좋아요 기능
    @RequestMapping(value = "/gboard/like.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String like(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int suc = gboardService.likeGBoard(map);
        resultMap.put("message", "성공" );
        resultMap.put("test", suc );
        return new Gson().toJson(resultMap);
    }

}
