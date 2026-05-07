-- Prevent a user from having more than 5 active loans
CREATE OR REPLACE FUNCTION check_user_loan_limit()
RETURNS TRIGGER AS $$
BEGIN
    IF (
        SELECT COUNT(*)
        FROM loans
        WHERE userid = NEW.userid
    ) >= 5 THEN
        RAISE EXCEPTION 'User % already has the maximum number of active loans', NEW.userid;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_check_user_loan_limit ON loans;

CREATE TRIGGER trg_check_user_loan_limit
BEFORE INSERT ON loans
FOR EACH ROW
EXECUTE FUNCTION check_user_loan_limit();


-- Prevent a book from being placed on hold by the same user twice
CREATE OR REPLACE FUNCTION prevent_duplicate_hold()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM holds
        WHERE userid = NEW.userid
          AND bookid = NEW.bookid
    ) THEN
        RAISE EXCEPTION 'User % already has a hold on book %', NEW.userid, NEW.bookid;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_prevent_duplicate_hold ON holds;

CREATE TRIGGER trg_prevent_duplicate_hold
BEFORE INSERT ON holds
FOR EACH ROW
EXECUTE FUNCTION prevent_duplicate_hold();


-- Prevent negative fine amounts
CREATE OR REPLACE FUNCTION check_fine_amount()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.amount < 0 THEN
        RAISE EXCEPTION 'Fine amount cannot be negative';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_check_fine_amount ON fines;

CREATE TRIGGER trg_check_fine_amount
BEFORE INSERT OR UPDATE ON fines
FOR EACH ROW
EXECUTE FUNCTION check_fine_amount();


-- ============================================================
-- Test examples
-- Uncomment these one at a time to test the triggers
-- ============================================================

-- This should fail if user 1 already has 5 loans:
-- INSERT INTO loans (loanid, duedate, userid, bookid)
-- VALUES (99, '2026-05-30', 1, 4);

-- This should fail if user 2 already has a hold on book 1:
-- INSERT INTO holds (holdid, holddate, userid, bookid)
-- VALUES (99, '2026-05-05', 2, 1);

-- This should fail because the fine amount is negative:
-- INSERT INTO fines (fineid, amount, loanid)
-- VALUES (99, -10.00, 1);