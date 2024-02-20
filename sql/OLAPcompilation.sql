#OLAP 1
SELECT c.RegionName,
			COUNT(CASE WHEN a.status = 'Complete' THEN 1 END) AS Complete_Count
FROM appointments a
JOIN clinics c ON a.clinicid = c.clinicid
WHERE c.RegionName = "National Capital Region (NCR)" and a.status = "Complete"
GROUP BY c.RegionName;
#OLAP 1 Indexing
CREATE INDEX idx_clinics_region ON clinics (RegionName);
#OLAP 1 Denorm
CREATE TABLE denormalized_table_OLAP1 AS
SELECT a.apptid, a.status, c.RegionName
FROM clinics c
JOIN appointments a ON a.clinicid = c.clinicid;

SELECT RegionName,
			COUNT(CASE WHEN a.status = 'Complete' THEN 1 END) AS Complete_Count,
			COUNT(CASE WHEN a.status = 'Queued' THEN 1 END) AS Queued_Count,
			COUNT(CASE WHEN a.status = 'NoShow' THEN 1 END) AS NoShow_Count,
			COUNT(CASE WHEN a.status = 'Serving' THEN 1 END) AS Serving_Count,
			COUNT(CASE WHEN a.status = 'Cancel' THEN 1 END) AS Cancel_Count
FROM denormalized_table_OLAP1
WHERE RegionName = "National Capital Region (NCR)";

#OLAP2
SELECT 
    CASE 
        WHEN MONTH(TimeQueued) = 1 THEN 'January'
        WHEN MONTH(TimeQueued) = 2 THEN 'February'
        WHEN MONTH(TimeQueued) = 3 THEN 'March'
        WHEN MONTH(TimeQueued) = 4 THEN 'April'
        WHEN MONTH(TimeQueued) = 5 THEN 'May'
        WHEN MONTH(TimeQueued) = 6 THEN 'June'
        WHEN MONTH(TimeQueued) = 7 THEN 'July'
        WHEN MONTH(TimeQueued) = 8 THEN 'August'
        WHEN MONTH(TimeQueued) = 9 THEN 'September'
        WHEN MONTH(TimeQueued) = 10 THEN 'October'
        WHEN MONTH(TimeQueued) = 11 THEN 'November'
        WHEN MONTH(TimeQueued) = 12 THEN 'December'
    END AS Month,
    status,
    COUNT(*) AS StatusCount
FROM
    appointments
WHERE
    YEAR(TimeQueued) = 2021
    AND MONTH(TimeQueued) = 3
GROUP BY
    Month,
    status;
#OLAP2 indexing
CREATE INDEX idx_appointments_OLAP2 ON appointments (TimeQueued, status);
#dont forget to drop this index before OLAP3
#OLAP2 Denorm
#Not applicable

#OLAP3
SELECT
    CASE MONTH(TimeQueued)
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
    END AS Month,
    is_Virtual,
    COUNT(*) AS VirtualCount
FROM
    appointments
WHERE
    YEAR(TimeQueued) = 2021
GROUP BY
    Month,
    is_Virtual;
#OLAP 3 Index
CREATE INDEX idx_appointments_OLAP3 ON appointments (TimeQueued, is_Virtual);
#dont forget to drop this index before OLAP4
#OLAP 3 Denorm
# Not Applicable

#OLAP 4
SELECT
    CASE MONTH(TimeQueued)
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
    END AS Month,
    app_type,
    COUNT(*) AS AppTypeCount
FROM
    appointments
WHERE
    YEAR(TimeQueued) = 2021
GROUP BY
    Month,
    app_type;
#OLAP 4 Index
CREATE INDEX idx_appointments_OLAP4 ON appointments (TimeQueued, app_type);
#dont forget to drop this index before OLAP5
#OLAP 4 Denorm
# Not Applicable

#OLAP 5
SELECT
    c.hospitalname,
    COUNT(a.apptid) AS CompleteAppointmentsCount
FROM
    clinics c
LEFT JOIN
    appointments a ON c.clinicid = a.clinicid AND a.status = 'Complete'
WHERE
    c.City = "Makati"
    AND c.hospitalname IS NOT NULL
GROUP BY
    c.hospitalname
ORDER BY
    CompleteAppointmentsCount DESC;
#OLAP 5 Indexing
CREATE INDEX idx_clinics_city ON clinics (City);
#OLAP 5 Denorm
CREATE TABLE denormalized_table_OLAP5 AS
SELECT a.apptid, c.hospitalname, c.City,c.Province,c.RegionName
FROM
    clinics c
LEFT JOIN
    appointments a ON c.clinicid = a.clinicid AND a.status = 'Complete';
    
SELECT
    hospitalname,
    COUNT(apptid) AS CompleteAppointmentsCount
FROM denormalized_table_OLAP5
WHERE     
	City = "Makati"
    AND hospitalname IS NOT NULL
GROUP BY
    hospitalname
ORDER BY
    CompleteAppointmentsCount DESC;






