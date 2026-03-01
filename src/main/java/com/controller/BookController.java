package com.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.Books;
import com.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    private static final Logger logger = LoggerFactory.getLogger(BookController.class);

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    @RequestMapping("/allBook")
    public String list(@RequestParam(required = false, defaultValue = "1", value = "pn") Integer pn,
                       Model model) {
        PageHelper.startPage(pn, 5);
        List<Books> list = bookService.queryAllBook();
        PageInfo<Books> pageInfo = new PageInfo<>(list, 5);
        model.addAttribute("pageInfo", pageInfo);
        return "allBook";
    }

    @RequestMapping("/toAddBook")
    public String toAddBook() {
        return "addBook";
    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST)
    public String addBook(Books books) {
        logger.info("Adding book: {}", books);
        bookService.addBook(books);
        return "redirect:/book/allBook";
    }

    @RequestMapping("/toUpdateBook")
    public String toUpdateBook(Model model, int id) {
        Books books = bookService.queryBookById(id);
        model.addAttribute("book", books);
        return "updateBook";
    }

    @RequestMapping(value = "/updateBook", method = RequestMethod.POST)
    public String updateBook(Books book) {
        logger.info("Updating book: {}", book);
        bookService.updateBook(book);
        return "redirect:/book/allBook";
    }

    @RequestMapping(value = "/del/{bookId}", method = RequestMethod.POST)
    public String deleteBook(@PathVariable("bookId") int id) {
        logger.info("Deleting book, id={}", id);
        bookService.deleteBookById(id);
        return "redirect:/book/allBook";
    }

    @RequestMapping(value = "/queryBook")
    public String queryBook(String queryBookName, Model model) {
        if (queryBookName == null || queryBookName.trim().isEmpty()) {
            return "redirect:/book/allBook";
        }
        List<Books> list = bookService.queryBookByName(queryBookName.trim());
        if (list == null || list.isEmpty()) {
            list = bookService.queryAllBook();
            model.addAttribute("error", "No results found");
        }
        PageInfo<Books> pageInfo = new PageInfo<>(list);
        model.addAttribute("pageInfo", pageInfo);
        return "allBook";
    }
}
