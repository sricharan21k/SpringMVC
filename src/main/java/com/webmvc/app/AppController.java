package com.webmvc.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/person")
public class AppController {
    private final PersonDao personDao;

    public AppController(PersonDao personDao) {
        this.personDao = personDao;
    }

    @GetMapping
    public String home(Model model) {
        model.addAttribute("personList", personDao.getAllRecords());
        return "home";
    }

    @GetMapping("/add")
    public String addPage(Model model) {
        model.addAttribute("action", "Add");
        return "person-form";
    }

    @PostMapping("/add")
    public String add(Person person) {
        personDao.addRecord(person);
        return "redirect:/person";
    }

    @GetMapping("/update/{id}")
    public String updatePage(@PathVariable int id, Model model) {
        model.addAttribute("action", "Update");
        model.addAttribute("person", personDao.getRecord(id));
        return "person-form";
    }

    @PostMapping("/update")
    public String update(Person person) {
        personDao.updateRecord(person);
        return "redirect:/person";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        personDao.deleteRecord(id);
        return "redirect:/person";
    }

    @GetMapping("/search")
    public String search(@RequestParam("filter") String filter, Model model) {
        model.addAttribute("personList", personDao.filterRecords(filter));
        return filter.isEmpty() ? "redirect:/person" : "home";
    }
}
