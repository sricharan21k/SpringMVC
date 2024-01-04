package com.webmvc.app;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PersonDao implements AppDao<Person> {
    private final JdbcTemplate jdbcTemplate;
    private final RowMapper<Person> rowMapper = (resultSet, row) -> {
        Person person = new Person();
        person.setId(resultSet.getInt("id"));
        person.setFirstname(resultSet.getString("firstname"));
        person.setLastname(resultSet.getString("lastname"));
        person.setAge(resultSet.getInt("age"));
        person.setCountry(resultSet.getString("country"));
        return person;
    };

    public PersonDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Person> getAllRecords() {
        String sql = "select * from person";
        return jdbcTemplate.query(sql, rowMapper);
    }

    public Person getRecord(int id) {
        String sql = "select * from person where id = ?";
        return jdbcTemplate.queryForObject(sql, rowMapper, id);

    }

    public void addRecord(Person person) {
        String sql = "insert into person (firstname, lastname, age, country) values (?, ?, ?, ?)";
        jdbcTemplate.update(sql, person.getFirstname(),
                person.getLastname(), person.getAge(), person.getCountry());
    }

    public void updateRecord(Person person) {
        String sql = "update person set firstname = ?, lastname = ?, age = ?, country = ? where id = ?";
        jdbcTemplate.update(sql, person.getFirstname(),
                person.getLastname(), person.getAge(), person.getCountry(), person.getId());
    }

    public void deleteRecord(int id) {
        String sql = "delete from person where id = ?";
        jdbcTemplate.update(sql, id);

    }

    public List<Person> filterRecords(String name) {
        String sql = "select * from person where firstname like concat('%', ?, '%')" +
                " or lastname like concat('%', ?, '%') or country like concat('%', ?, '%')";
        return jdbcTemplate.query(sql, rowMapper, name, name, name);
    }


}
