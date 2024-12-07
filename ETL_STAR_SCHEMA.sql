-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS ExampleDB;
USE ExampleDB;

-- Step 2: Create the dimension tables
CREATE TABLE Dimension1 (
                            ID INT AUTO_INCREMENT PRIMARY KEY,
                            Name VARCHAR(100) NOT NULL
);

CREATE TABLE Dimension2 (
                            ID INT AUTO_INCREMENT PRIMARY KEY,
                            Description VARCHAR(255) NOT NULL
);

CREATE TABLE Dimension3 (
                            ID INT AUTO_INCREMENT PRIMARY KEY,
                            Value DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Dimension4 (
                            ID INT AUTO_INCREMENT PRIMARY KEY,
                            Date DATE NOT NULL
);

CREATE TABLE Dimension5 (
                            ID INT AUTO_INCREMENT PRIMARY KEY,
                            Category VARCHAR(50) NOT NULL
);

-- Step 3: Create the fact table referencing all dimension tables
CREATE TABLE FactTable (
                           FactID INT AUTO_INCREMENT PRIMARY KEY,
                           Dimension1ID INT NOT NULL,
                           Dimension2ID INT NOT NULL,
                           Dimension3ID INT NOT NULL,
                           Dimension4ID INT NOT NULL,
                           Dimension5ID INT NOT NULL,
                           Measure DECIMAL(15, 2) NOT NULL,
                           FOREIGN KEY (Dimension1ID) REFERENCES Dimension1(ID),
                           FOREIGN KEY (Dimension2ID) REFERENCES Dimension2(ID),
                           FOREIGN KEY (Dimension3ID) REFERENCES Dimension3(ID),
                           FOREIGN KEY (Dimension4ID) REFERENCES Dimension4(ID),
                           FOREIGN KEY (Dimension5ID) REFERENCES Dimension5(ID)
);

