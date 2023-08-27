package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.GBoardMapper;
import com.example.project.model.DeliveryUser;
import com.example.project.model.GBoard;

@Service
public class GBoardServiceImpl implements GBoardService{
	@Autowired
	GBoardMapper gboardMapper;
	

	//전체 게시글 출력
	@Override
	public List<GBoard> searchGBoardList(HashMap<String, Object> map) {
		return gboardMapper.selectGBoardList(map);
	}

	//아티스트 글만 출력
	@Override
	public List<GBoard> searchArtistGBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.selectArtistGBoard(map);
	}
	
	//게시글 작성 기능 + 아티스트인지 체크하고 맞으면 파라미터 check랑 에 보내기
	@Override
	public HashMap<String, Object> addGBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		int artistCheck = gboardMapper.selectArtistCheck(map);
		
		if(artistCheck == 0) {
			gboardMapper.insertGBoard(map);
			resultMap.put("gNo", map.get("gNo"));
		}else {
			map.put("check", "Y");
			map.put("type", "WRITE");
			
			var message = map.get("uId") + "님이 게시글을 작성하였습니다!";
			map.put("message", message);
			
			gboardMapper.insertGBoard(map);
			gboardMapper.insertAlram(map);
			resultMap.put("gNo", map.get("gNo"));
		}
		
		return resultMap;
	}
	
	//게시글 작성 후 이미지 파일 첨부
	@Override
	public int addGBoardImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.insertGBoardImg(map);
	}
	
	//게시글 삭제 기능
	@Override
	public int removeGBoard(HashMap<String, Object> map) {
		gboardMapper.deleteGBoardImg(map);
		return gboardMapper.deleteGBoard(map);
	}

	//게시글 검색 기능
	@Override	
	public List<GBoard> searchGBoardInfo(HashMap<String, Object> map) {
		return gboardMapper.selectGBoardInfo(map);
	}

	//게시글 좋아요 +1 하거나 이미 했으면 -1 하는 기능
	@Override
	public int likeGBoard(HashMap<String, Object> map) {
	    int result = gboardMapper.checkLike(map);
	    
	    if (result > 0) {
	        gboardMapper.minusLikeGBoard(map);
	        gboardMapper.minusLike(map);
	        
	        return -1;
	    } else {
	    
	    	gboardMapper.plusLikeGBoard(map);
	        gboardMapper.plusLike(map);
	        
	        int artistCheck = gboardMapper.selectArtistCheck(map);
	        List<GBoard> list = gboardMapper.selectMyBoadAlamList(map);
	        boolean duplicateAlert = false;
	        
				for (int i = 0; i < list.size(); i++) {
				    GBoard gboard = list.get(i);
				    if (gboard.getuId().equals(map.get("uId")) && ("LIKE").equals(gboard.getNoType()) && gboard.getgNo() == Integer.parseInt((String) map.get("gNo"))) {
				        System.out.println("중복 알람임 한번만 하셈");
				        duplicateAlert = true;
				        break; // 이미 중복 알람을 확인했으므로 루프 종료
				    }
				}
				
				if (!duplicateAlert) {
				    map.put("check", artistCheck == 0 ? "N" : "Y");
				    map.put("type", "LIKE");
				    var message = map.get("uId") + "님이 게시글에 좋아요를 눌렀습니다.";
				    map.put("message", message);
				    gboardMapper.insertAlram(map);
				}
	        return 1;
	    }
	}

	//댓글 출력
	@Override
	public List<GBoard> searchComment(HashMap<String, Object> map) {
		return gboardMapper.selectComment(map);
	}
	
	
	//댓글 추가
	@Override
	public int addComment(HashMap<String, Object> map) {
		
		int artistCheck = gboardMapper.selectArtistCheck(map);
		
		if(artistCheck == 0) {
			map.put("check", "N");
			map.put("type", "COMM");
			
			var message = map.get("uId") + "님이 게시글에 댓글을 작성하였습니다.";
			map.put("message", message);
			
			gboardMapper.insertComment(map);
			gboardMapper.insertAlram(map);
			gboardMapper.insertComment(map);
		}else {
			map.put("check", "Y");
			map.put("type", "COMM");
			
			var message = map.get("uId") + "님이 게시글에 댓글을 작성하였습니다.";
			map.put("message", message);
			
			gboardMapper.insertComment(map);
			gboardMapper.insertAlram(map);
		}
		
		
		return 1;
	}

	//댓글 삭제
	@Override
	public int removeComment(HashMap<String, Object> map) {
		return gboardMapper.deleteComment(map);
	}

	//댓글 좋아요
	@Override
	public int likeComment(HashMap<String, Object> map) {
	    int result = gboardMapper.checkLikeComment(map);
	    
	    if (result > 0) {
	        gboardMapper.minusLikeComment(map);
	        gboardMapper.minusLikeComment2(map);
	        return -1; // 좋아요 취소된 경우 -1 반환
	    } else {
	        gboardMapper.plusLikeComment(map);
	        gboardMapper.plusLikeComment2(map);
	        
	        int artistCheck = gboardMapper.selectArtistCheck(map);
	        List<GBoard> list = gboardMapper.selectMyCommnetAlamList(map);
	        boolean duplicateAlert = false;
	        
				for (int i = 0; i < list.size(); i++) {
				    GBoard gboard = list.get(i);
				    if (gboard.getuId().equals(map.get("uId")) && ("LIKE").equals(gboard.getcNoType()) && gboard.getGcNo() == Integer.parseInt((String) map.get("gcNo"))) {
				        System.out.println("중복 알람임 한번만 하셈");
				        duplicateAlert = true;
				        break; // 이미 중복 알람을 확인했으므로 루프 종료
				    }
				}
				
				if (!duplicateAlert) {
				    map.put("check", artistCheck == 0 ? "N" : "Y");
				    map.put("type", "LIKE");
				    var message = map.get("uId") + "님이 댓글에 좋아요를 눌렀습니다.";
				    map.put("message", message);
				    gboardMapper.insertCommentAlram(map);
				}
	        
	        return 1; // 좋아요 추가된 경우 1 반환
	    }
	}

	//대댓글 추가 
	@Override
	public int addCocomment(HashMap<String, Object> map) {
		
		int artistCheck = gboardMapper.selectArtistCheck(map);
				
				if(artistCheck == 0) {
					map.put("check", "N");
					map.put("type", "COCOMM");
					
					var message = map.get("uId") + "님이 댓글에 대댓글을 작성하였습니다.";
					map.put("message", message);
					
					gboardMapper.insertCocomment(map);
					gboardMapper.insertCommentAlram(map);
				}else {
					map.put("check", "Y");
					map.put("type", "COCOMM");
					
					var message = map.get("uId") + "님이 댓글에 대댓글을 작성하였습니다.";
					map.put("message", message);
					
					gboardMapper.insertCocomment(map);
					gboardMapper.insertCommentAlram(map);
				}
		
		return 1;
	}
	
	//대댓글 출력
	@Override
	public List<GBoard> searchCocomment(HashMap<String, Object> map) {
		return gboardMapper.selectCocomment(map);
	}

	//대댓글 삭제
	@Override
	public int removeCocomment(HashMap<String, Object> map) {
		return gboardMapper.deleteCocomment(map);
	}

	//신고 -> 게시글 신고 횟수 증가 + 신고 테이블에 insert
	@Override
	public int addReport(HashMap<String, Object> map) {
		gboardMapper.reportCnt(map);
		return gboardMapper.insertReport(map);
	}
	
	//신고 -> 댓글 신고 횟수 증가 + 댓글용 신고 테이블에 insert
	@Override
	public int addGCReport(HashMap<String, Object> map) {
		gboardMapper.gcBanCnt(map);
		return gboardMapper.insertGCReport(map);
	}

	
	//마이페이지 작성글 모두 출력 : 게시글 -> 댓글 -> 대댓글 순
	@Override
	public List<GBoard> searchsMypageGBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.selectMypageGBoard(map);
	}
	@Override
	public List<GBoard> searchMypageComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.selectMypageComment(map);
	}
	
	@Override
	public List<GBoard> searchMypageCoComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.selectMypageCoComment(map);
	}
	
	
	//마이페이지 프로필 출력
	@Override
	public List<GBoard> searchProfile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.selectProfile(map);
	}

	//마이페이지 멤버쉽 정보 출력
	@Override
	public List<GBoard> searchsMembership(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.selectMembership(map);
	}

	//프로필 추가 기능
	@Override
	public HashMap<String, Object> addProfile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("gpNo", map.get("gpNo"));
		 gboardMapper.insertProfile(map);
		 return resultMap;
	}

	//프로필 닉네임 업데이트 (수정)
	@Override
	public int updateProfile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.updateProfile(map);
	}

	//프로필 이미지 업데이트 (수정)
	@Override
	public int updateProfileImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.updateProfileImg(map);
	}

	//프로필 이미지 삭제
	@Override
	public int removeProfileImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.deleteProfileImg(map);
	}

//알림 기능 구현
	
	//내 글에 댓글 달린 갯수 + 아이디
	@Override
	public List<GBoard> searchMyBoadCommentCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.selectMyBoadCommentList(map);
	}
	
	//내 글에 좋아요 달린 갯수 + 아이디
	@Override
	public List<GBoard> searchMyBoardLikeCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.selectMyBoardLikeList(map);
	}

	//내 댓글에 대댓글 달린 갯수 + 아이디
	@Override
	public List<GBoard> searchMyCommentCoCommentCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.selectMyCommentCoCommentList(map);
	}

	//내 댓글에 좋아요 달린 갯수 + 아이디
	@Override
	public List<GBoard> searchMyCommentLikeCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.selectMyCommentLikeList(map);
	}

	

}
