SELECT
    YEAR(StartTime) AS Year,
    MONTH(StartTime) AS Month,
    COUNT(*) AS AppointmentCount
FROM
    appointments
GROUP BY
    YEAR(StartTime),
    MONTH(StartTime)
ORDER BY YEAR(StartTime)

SELECT
    c.RegionName,
    COUNT(a.apptid) AS ConsultationCount
FROM
    clinics c
JOIN
    appointments a ON c.clinicid = a.clinicid
GROUP BY
    c.RegionName;
