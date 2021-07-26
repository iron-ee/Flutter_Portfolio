package com.cos.flutterPhoneBook.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.cos.flutterPhoneBook.domain.Item;
import com.cos.flutterPhoneBook.domain.ItemRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ItemService {
	
	private final ItemRepository itemRepository;
	
	public List<Item> 전체보기() {
		return itemRepository.findAll();
	}
	
	public Item 저장하기(Item item) {
		return itemRepository.save(item);
	}
	
	public Item 상세보기(Long id) {
		return itemRepository.findById(id).get();
	}
	
	@Transactional
	public void 삭제하기(Long id) {
		itemRepository.deleteById(id);
	}
	
	@Transactional
	public Item 수정하기(Long id, Item item) {
		// 영속화
		Item itemEntity = itemRepository.findById(id).get();
		
		// 영속화 된 객체를 수정
		itemEntity.setName(item.getName());
		itemEntity.setTel(item.getTel());
		
		return itemEntity;
	}	// 서비스 종료시에 영속성 컨텍스트가 변경을 감지해서 flush()
}