package com.cos.flutterPhoneBook.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.flutterPhoneBook.controller.dto.CMRespDto;
import com.cos.flutterPhoneBook.domain.Item;
import com.cos.flutterPhoneBook.service.ItemService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class ItemController {

	private final ItemService itemService;
	
	@GetMapping("/item")
	public CMRespDto<?> findAll() {
		return new CMRespDto<>(1, "전체찾기 성공", itemService.전체보기());
	}
	
	@GetMapping("/item/{id}")
	public CMRespDto<?> findById(@PathVariable Long id) {
		return new CMRespDto<>(1, "상세보기 완료", itemService.상세보기(id));
	}
	
	@DeleteMapping("/item/{id}")
	public CMRespDto<?> delete(@PathVariable Long id) {
		itemService.삭제하기(id);
		return new CMRespDto<>(1, "삭제 완료", null);
	}
	
	@PutMapping("/item/{id}")
	public CMRespDto<?> update(@PathVariable Long id, @RequestBody Item item) {
		return new CMRespDto<>(1, "수정 완료", itemService.수정하기(id, item));
	}
	
	@PostMapping("/item")
	public CMRespDto<?> save(@RequestBody Item item) {
		return new CMRespDto<>(1, "저장 완료", itemService.저장하기(item));
	}
}
