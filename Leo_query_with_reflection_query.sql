-- Query: suiteAvailability - Sort available suites by the number of beds
SELECT
    s.htID,
    s.sutNumber,
    s.suiteNoOfBeds,
    h.htAddress,
     MAX(b.bkCheckInDate) AS CheckInNotAvailable,
    MAX(b.bkCheckOutDate) AS CheckInAvailable
FROM
    mydb.suite s
JOIN
    mydb.hotel h ON s.htID = h.htID
LEFT JOIN
    mydb.booking b ON s.htID = b.htID AND s.sutNumber = b.sutNumber
GROUP BY
    s.htID, s.sutNumber, s.suiteNoOfBeds, h.htAddress
HAVING
    MAX(b.bkCheckInDate) IS NOT NULL AND MAX(b.bkCheckOutDate) IS NOT NULL
ORDER BY
    s.suiteNoOfBeds ASC, h.htAddress, s.sutNumber;

-- Reflection Query: suiteAvailability - Sort available suites by the number of beds
SELECT
    s.htID,
    s.sutNumber,
    s.suiteNoOfBeds,
    h.htAddress,
     MAX(b.bkCheckInDate) AS CheckOutNotAvailable,
    MAX(b.bkCheckOutDate) AS CheckInNotAvailable
FROM
    mydb.suite s
JOIN
    mydb.hotel h ON s.htID = h.htID
LEFT JOIN
    mydb.booking b ON s.htID = b.htID AND s.sutNumber = b.sutNumber
GROUP BY
    s.htID, s.sutNumber, s.suiteNoOfBeds, h.htAddress
ORDER BY
    s.suiteNoOfBeds ASC, h.htAddress, s.sutNumber;
    