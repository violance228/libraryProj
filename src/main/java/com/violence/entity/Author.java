package com.violence.entity;

import com.violence.repository.AuthorBooksRepositoryImpl;
import com.violence.util.api.annotation.Column;
import com.violence.util.api.annotation.Contact;

import java.util.Objects;
import java.util.Set;

public class Author implements DomainObject<Author> {
    @Column("author_id")
    private Long id;
    @Column("author_id")
    private String name;
    @Column("author_id")
    private String surname;
    @Column("country")
    private String country;
    @Column(value = "book_id")
    @Contact(value = "book_id", queryExecuteClass = AuthorBooksRepositoryImpl.class)
    private Set<Book> books;

    public Author(Long id, String name, String surname, String country) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.country = country;
    }

    public Author() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Set<Book> getBooks() {
        return books;
    }

    public void setBooks(Set<Book> books) {
        this.books = books;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Author author = (Author) o;
        return Objects.equals(id, author.id) &&
                Objects.equals(name, author.name) &&
                Objects.equals(surname, author.surname) &&
                Objects.equals(country, author.country);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, surname, country);
    }

    @Override
    public String toString() {
        return " ( " + id + ", \'" +
                name + "\', \'" +
                surname + "\', \'" +
                country + "\' )";
    }
    @Override
    public String getFieldVsValue() {
        return  "id= '" + id + '\'' +
                ", name= '" + name + '\'' +
                ", surname= '" + surname + '\'' +
                ", country= '" + country + '\'';
    }

//    @Override
//    public Author getObject(ResultSet resultSet) throws SQLException {
//        Author author = new Author();
//
//        author.setId(resultSet.getLong("author_id"));
//        author.setName(resultSet.getString("author_name"));
//        author.setSurname(resultSet.getString("author_surname"));
//        author.setCountry(resultSet.getString("country"));
//
//        return author;
//    }
}
