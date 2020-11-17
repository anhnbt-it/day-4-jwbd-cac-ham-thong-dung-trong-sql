-- Câu 1: Introduction
SELECT * FROM fake_apps;

-- Câu 2: Sử dụng COUNT
SELECT COUNT(*)
FROM fake_apps
WHERE price = 0;

-- Câu 3: Sử dụng SUM
SELECT SUM(downloads)
FROM fake_apps;

-- Câu 4: Sử dụng MAX / MIN
SELECT MAX(price)
FROM fake_apps;

-- Câu 5: Sử dụng AVG - Average
SELECT AVG(price)
FROM fake_apps;

-- Câu 6: Sử dụng ROUND
SELECT ROUND(AVG(price), 2)
FROM fake_apps;

-- Câu 7: Sử dụng GROUP BY
SELECT category,
  SUM(downloads)
FROM fake_apps
GROUP BY category;

-- Câu 8: Sử dụng GROUP BY
SELECT category,
  price,
  AVG(downloads)
FROM fake_apps
GROUP BY category, price;

-- Câu 9: Bài tập sử dụng mệnh đề HAVING
-- Lấy các bản ghi có hơn 10 ứng dụng
SELECT price,
  ROUND(AVG(downloads)),
  COUNT(*) AS total
FROM fake_apps
GROUP BY price
HAVING total > 10;