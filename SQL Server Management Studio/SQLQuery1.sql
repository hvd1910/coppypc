SELECT * FROM IssueDetails

INSERT INTO IssueDetails (BookCode, MemberCode)
VALUES (1,'22')

ALTER TABLE IssueDetails
ALTER COLUMN BookCode int	NOT NULL;

ALTER TABLE IssueDetails
ADD CONSTRAINT FK_BookCode FOREIGN KEY (BookCode) REFERENCES BookLibrary(BookCode)

ALTER TABLE IssueDetails
DROP CONSTRAINT FK_BookCode






SELECT * FROM BookLibrary


INSERT INTO BookLibrary (BookCode, BookTitle, Author)
VALUES (2,'Cay khe','HVD')

ALTER TABLE BookLibrary
ALTER COLUMN BookCode INT NOT NULL;

ALTER TABLE BookLibrary
ADD PRIMARY KEY (BookCode)


ALTER TABLE BookLibrary
DROP CONSTRAINT PK__BookLibr__0A5FFCC6FFF63998



SELECT * FROM Member

ALTER TABLE Member
ADD CONSTRAINT RG_PhoneNumber UNIQUE(PhoneNumber)