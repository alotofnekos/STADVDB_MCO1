CREATE TABLE px (
    pxid VARCHAR(32) NOT NULL,
    age INT DEFAULT -1,
    gender ENUM('MALE', 'FEMALE', 'NOTAVAILABLE', 'OTHER') DEFAULT 'NOTAVAILABLE',
    PRIMARY KEY (pxid)
);

CREATE TABLE px_dup (
    pxid VARCHAR(32) NOT NULL,
    age INT DEFAULT -1,
    gender ENUM('MALE', 'FEMALE', 'NOTAVAILABLE', 'OTHER') DEFAULT 'NOTAVAILABLE'
);

CREATE TABLE clinics (
    clinicid VARCHAR(32) NOT NULL,
    hospitalname VARCHAR(255),
    IsHospital ENUM('TRUE', 'FALSE', 'NOTAVAILABLE') DEFAULT 'NOTAVAILABLE',
    City VARCHAR(50),
    Province VARCHAR(50),
    RegionName VARCHAR(255),
    PRIMARY KEY (clinicid)
);

CREATE TABLE doctors (
    doctorid VARCHAR(32) NOT NULL,
    mainspecialty VARCHAR(255) DEFAULT 'NOTAVAILABLE',
    age INT DEFAULT -1,
    PRIMARY KEY (doctorid)
);

CREATE TABLE appointments (
    pxid VARCHAR(32) NOT NULL,
    clinicid VARCHAR(32) NOT NULL,
    doctorid VARCHAR(32) NOT NULL,
    apptid VARCHAR(32) NOT NULL,
    status VARCHAR(20),
    TimeQueued DATETIME,
    QueueDate DATETIME,
    StartTime DATETIME,
    EndTime DATETIME,
    app_type VARCHAR(20),
    is_Virtual ENUM('TRUE', 'FALSE', 'NOTAVAILABLE') DEFAULT 'NOTAVAILABLE',
    PRIMARY KEY (apptid)
);

/*,
    FOREIGN KEY (pxid) REFERENCES px(pxid),
    FOREIGN KEY (clinicid) REFERENCES clinics(clinicid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)*/


