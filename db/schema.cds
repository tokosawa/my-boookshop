namespace my.bookshop;
using { Country, managed } from '@sap/cds/common';

entity Books {
    Key ID : Integer;
    title  : localized String;
    author : Association to Authors;
    stock  : Integer;
}

entity Authors {
    Key ID : Integer;
    name   : String;
    books  : Association to many Books on books.author = $self; 
}

entity Orders : managed {
    Key ID  : UUID;
    book    : Association to Books;
    country : Country;
    amount  : Integer;
}