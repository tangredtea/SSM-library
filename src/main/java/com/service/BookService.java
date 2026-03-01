package com.service;

import com.pojo.Books;

import java.util.List;

public interface BookService {

    int addBook(Books book);

    int deleteBookById(int id);

    int updateBook(Books books);

    Books queryBookById(int id);

    List<Books> queryAllBook();

    List<Books> queryBookByName(String bookName);
}
