INSERT INTO college VALUES 
    (1,'Physical Science and Engineering'),
    (2,'College of Business and Communication'),
    (3,'College of Language and Letters');
    
INSERT INTO department VALUES 
    ('CIT','Computer Information Technology',1),
    ('ECON','Economics',2),
    ('HUM','Humanities',3);
    
INSERT INTO course VALUES 
    (111,'CIT','Intro to Databases',3),
    (150,'ECON','Micro Economics',3),
    (376,'HUM','Classical Heritage',2),
    (388,'ECON','Econometrics',4);

INSERT INTO `faculty` VALUES 
    (1,'Morring','Marty','CIT'),
    (2,'Barney','Bill','CIT'),
    (3,'Barrus','Ben','ECON'),
    (4,'Nate','Nathan','ECON'),
    (5,'Jensen','John','HUM'),
    (6,'Flora','Fiona','HUM');

INSERT INTO `term` VALUES 
    (1,'Fall',2019),
    (2,'Winter',2018),
    (3,'Spring',2017);
    
INSERT INTO `student` VALUES 
    (1,'Miller','Paul','M','Dallas','TX','1996-02-22'),
    (2,'Smith','Katie','F','Provo','UT','1995-07-22'),
    (3,'Jones','Kelly','F','Provo','UT','1998-06-22'),
    (4,'Merrill','Devon','M','Mesa','AZ','2000-07-22'),
    (5,'Murdock','Mandy','F','Topeka','KS','1996-11-22'),
    (6,'Adams','Alece','F','Rigby','ID','1997-05-22'),
    (7,'Carlson','Bryce','M','Bozeman','MT','1997-11-22'),
    (8,'Larsen','Preston','M','Decatur','TN','1996-09-22'),
    (9,'Madsen','Julia','F','Rexburg','ID','1998-09-22'),
    (10,'Sorensen','Susan','F','Mesa','AZ','1998-08-09');

    
INSERT INTO `section` VALUES 
    (1,1,30,1,111,'CIT',1),
    (2,1,35,1,388,'ECON',3),
    (3,1,50,1,150,'ECON',4),
    (4,2,50,1,150,'ECON',4),
    (5,1,30,1,376,'HUM',5),
    (6,2,30,2,111,'CIT',1),
    (7,3,35,2,111,'CIT',2),
    (8,1,50,2,150,'ECON',4),
    (9,2,50,2,150,'ECON',4),
    (10,1,30,2,376,'HUM',5);
    
INSERT INTO `enrollment` VALUES 
    (1,1),
    (4,1),
    (2,2),
    (2,3),
    (5,4),
    (2,5),
    (5,5),
    (7,6),
    (6,7),
    (8,7),
    (10,7),
    (9,8),
    (9,9),
    (6,10);