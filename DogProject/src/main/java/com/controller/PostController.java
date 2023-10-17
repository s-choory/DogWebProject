package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dto.FileDTO;
import com.dto.PageDTO;
import com.dto.PostsDTO;
import com.dto.UsersDTO;
import com.service.FileService;
import com.service.PageService;
import com.service.PostsService;

@Controller
public class PostController {
	
	@Autowired
	PostsService Postsservice;	
	@Autowired 
	PageService Pageservice;
	@Autowired
	FileService fservice;
	
	/* community */
	//커뮤니티메인화면
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)
	public String community(Locale locale, Model model) {
		List<PostsDTO> list = Postsservice.selectList();
		model.addAttribute("list",list);
		System.out.println(list); // list 확인
		
		return "community/community_main";
	}
	
	/* 페이징 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String page(String curPage, Model model, PageDTO pDTO ,HttpServletRequest request, HttpServletResponse response) {
	
		if(curPage == null) curPage = "1";
		String search= request.getParameter("search");
		String order= request.getParameter("order");
		System.out.println(search);
		
		pDTO = Pageservice.selectAll(Integer.parseInt(curPage), search, pDTO, order);
		System.out.println("curPage>>>>>>"+curPage);
		System.out.println(pDTO.getTotalCount());
		System.out.println(pDTO.getList());
		model.addAttribute("pDTO",pDTO);
		model.addAttribute("search", search);
		model.addAttribute("order", order);
		return "community/community_main";
	}
	
	//상세보기
	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public String post(Locale locale, Model model) {
		return "community/community_post";
	}
	//등록화면
	@RequestMapping(value = "/addPost", method = RequestMethod.GET)
	public String addPost(Locale locale, Model model) {
		return "community/community_addPost";
	}
	
	
	@RequestMapping(value = "/addPost", method = RequestMethod.POST)
	public String addPost(HttpSession session, PostsDTO post, @RequestParam("files") MultipartFile[] files, Model model) {
	    UsersDTO udto = (UsersDTO) session.getAttribute("User");
	    post.setAuthorID(udto.getUserID());
	    
	    /////////  ckeditor 관련 실제로 업로드 된 파일들을 임시폴더 -> 정식 업로드 폴더로 옮기고 임시폴더의 파일들은 삭제함
	    String tempFolderPath = "C:/temp";
	    String uploadFolderPath = "C:/upload";
	    File tempFolder = new File(tempFolderPath);
	    File[] ckfiles = tempFolder.listFiles();
	    
	    if (files != null) {
	        for (File ckfile : ckfiles) {
	            if (ckfile.isFile()) {
	                if (isFileUsedInPost(ckfile.getName(), post)) {
	                    try {
	                        String uploadFilePath = uploadFolderPath + "/" + ckfile.getName();
	                        Files.copy(ckfile.toPath(), Paths.get(uploadFilePath), StandardCopyOption.REPLACE_EXISTING);

	                        // 이미지 주소 변경
	                        String imageUrlInContentTemp = "/temp/" + ckfile.getName();
	                        String imageUrlInContentUpload = "/upload/" + ckfile.getName();
	                        String modifiedContent = post.getContent().replace(imageUrlInContentTemp, imageUrlInContentUpload);
	                   
	                        post.setContent(modifiedContent);
	                    } catch (IOException e) {
	                        e.printStackTrace();
	                    }
	                }
	                
	                ckfile.delete();
	            }
	        }
	    }
	 // 글쓰기 업로드
	    int find_postid = Postsservice.addPost(post); 
	   

	    // 멀티 파일 업로드 기능 구현
	    for (MultipartFile file : files) {
	        if (!file.isEmpty()) {
	            try {

	                String originalFilename = file.getOriginalFilename();
	                String extension = originalFilename.substring(originalFilename.lastIndexOf("."));

	                String randomFileName = UUID.randomUUID().toString() + extension;

	                String uploadPath = "C:/upload/";

	                File saveFile = new File(uploadPath + randomFileName);
	                file.transferTo(saveFile);
	                String fileUrl = "http://localhost:8083/upload/" + randomFileName;

	                FileDTO fileDto = new FileDTO();
	                
					fileDto.setRealname(originalFilename);
					fileDto.setExtension(extension);
					fileDto.setFilename(randomFileName);
					fileDto.setUploadpath(uploadPath);
					fileDto.setFileurl(fileUrl);
					fileDto.setPostid(find_postid);
	             
	           // 파일 정보 db에 등록
	                fservice.insert(fileDto);
	            } catch (IOException e) {
	            }
	        }
	    }

	   return "community/community_post";
	}

	// 등록된 글의 content에 실제로 업로드 된 이미지 파일들을 확인
	private boolean isFileUsedInPost(String fileName, PostsDTO post) {
	  String imageUrlInContent = "/temp/" + fileName;  
	  
	  boolean usedInContent = post.getContent().contains(imageUrlInContent);
	  
	  return usedInContent;
	}
}
