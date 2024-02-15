CREATE TABLE px (
    pxid VARCHAR(32) NOT NULL,
    age INT DEFAULT -1,
    gender ENUM('MALE', 'FEMALE', 'NOTAVAILABLE', 'OTHER') DEFAULT 'NOTAVAILABLE',
    PRIMARY KEY (pxid)
);

CREATE TABLE clinics (
    clinicid VARCHAR(32) NOT NULL,
    hospitalname VARCHAR(255) NOT NULL,
    IsHospital ENUM('TRUE', 'FALSE', 'NOTAVAILABLE') DEFAULT 'NOTAVAILABLE' NOT NULL,
    City VARCHAR(50) NOT NULL,
    Province VARCHAR(50) NOT NULL,
    RegionName VARCHAR(255) NOT NULL,
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
    status VARCHAR(20) NOT NULL,
    TimeQueued DATETIME,
    QueueDate DATETIME,
    StartTime DATETIME,
    EndTime DATETIME,
    app_type VARCHAR(20),
    is_Virtual ENUM('TRUE', 'FALSE', 'NOTAVAILABLE') DEFAULT 'NOTAVAILABLE' NOT NULL,
    PRIMARY KEY (apptid),
    FOREIGN KEY (pxid) REFERENCES px(pxid),
    FOREIGN KEY (clinicid) REFERENCES clinics(clinicid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);



