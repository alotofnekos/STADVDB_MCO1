CREATE TABLE px (
    pxid VARCHAR(32) NOT NULL,
    age INT DEFAULT -1 CHECK (age >= 0 OR age IS NULL) NOT NULL,
    gender ENUM('MALE', 'FEMALE', 'N/A', 'OTHER') DEFAULT 'N/A' NOT NULL,
    PRIMARY KEY (pxid)
);

CREATE TABLE clinics (
    clinicid VARCHAR(32) NOT NULL,
    hospitalname VARCHAR(255) NOT NULL,
    IsHospital ENUM('TRUE', 'FALSE', 'N/A') DEFAULT 'N/A' NOT NULL,
    City VARCHAR(50) NOT NULL,
    Province VARCHAR(50) NOT NULL,
    RegionName VARCHAR(255) NOT NULL,
    PRIMARY KEY (clinicid)
);

CREATE TABLE doctors (
    doctorid VARCHAR(32) NOT NULL,
    mainspecialty VARCHAR(255) DEFAULT 'N/A' NOT NULL,
    age INT DEFAULT -1 CHECK (age >= 0 OR age IS NULL) NOT NULL,
    PRIMARY KEY (doctorid)
);

CREATE TABLE appointments (
    pxid VARCHAR(32) NOT NULL,
    clinicid VARCHAR(32) NOT NULL,
    doctorid VARCHAR(32) NOT NULL,
    apptid VARCHAR(32) NOT NULL,
    status VARCHAR(20) NOT NULL,
    TimeQueued DATETIME,
    QueueDate DATETIME,
    StartTime DATETIME,
    EndTime DATETIME,
    app_type VARCHAR(20),
    is_Virtual ENUM('TRUE', 'FALSE', 'N/A') DEFAULT 'N/A' NOT NULL,
    PRIMARY KEY (apptid),
    FOREIGN KEY (pxid) REFERENCES px(pxid),
    FOREIGN KEY (clinicid) REFERENCES clinics(clinicid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);



