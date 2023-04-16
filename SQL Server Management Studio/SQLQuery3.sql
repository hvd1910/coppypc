CREATE TABLE BookLibrary (
BookCode int,
BookTitle nvarchar(100),
Author nvarchar(50),
Edition int, 
BookPrice money,
Copies int
)
select * from BookLibrary

INSERT INTO BookLibrary (BookCode, BookTitle, Author, Edition, BookPrice, Copies)
VALUES (1, N'Dế Mèn Phiêu Lưu Ký', N'Tô Hoài', 5, '70000', 7)
INSERT INTO BookLibrary (BookCode, BookTitle, Author, Edition, BookPrice, Copies)
VALUES  (2, N'Cách Bán 1 Tỷ Gói Mè', N'Nguyễn Thành Long', 1, '99900',2)

DELETE FROM BookLibrary
WHERE Copies <8

CREATE TABLE Member(
MemberCode int,
Name nvarchar(50),
Address nvarchar(100),
PhoneNumber int
)

SELECT * FROM Member




CREATE TABLE IssueDetails (
BookCode int,
MemberCode int,
IssueDate datetime,
ReturnDate datetime
)
	
SELECT * FROM IssueDetails


ALTER TABLE BookLibrary
ADD PRIMARY KEY (BookCode)


ALTER TABLE BookLibrary
DROP PRIMARY KEY (BookCode)

ALTER TABLE IssueDetails
ADD  FOREIGN  KEY (BookCode) REFERENCES BookLibrary(BookCode)



CREATE TABLE sales(
    event_id INT,
    event_name VARCHAR(255),
    start_date DATE NOT NULL,
    duration DEC(5,2)
);

SELECT * FROM sales

ALTER TABLE sales
ADD PRIMARY KEY(event_id);