INSERT INTO page (title)
  SELECT dest
    FROM  UNION
  SELECT src
    FROM 
    ON DUPLICATE KEY
      UPDATE title=title;

SELECT STR_TO_DATE('', '%Y-%m-%d') INTO @date;

INSERT INTO request (srcID, destID, month, type, count)
  SELECT src.id, dest.id, @date, req.type, req.count
    FROM  as req, page as src, page as dest
    WHERE src.title=req.src and dest.title=req.dest
    ON DUPLICATE KEY
      UPDATE
        request.count=request.count+req.count;