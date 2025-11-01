PRAGMA foreign_keys = ON;

-- =========================
-- BRANCH + EMPLOYEE
-- =========================
CREATE TABLE branch (
    BID          INTEGER PRIMARY KEY,
    Bname        TEXT NOT NULL UNIQUE,
    budget       INTEGER NOT NULL,
    location     TEXT NOT NULL,
    phone_number TEXT NOT NULL UNIQUE,
    MEID         INTEGER,
    FOREIGN KEY (MEID) REFERENCES employee(EID)
);

CREATE TABLE employee (
    EID          INTEGER PRIMARY KEY,
    EFname       TEXT NOT NULL,
    Eminit       TEXT NOT NULL,
    ELname       TEXT NOT NULL,
    salary       INTEGER NOT NULL,
    job_title    TEXT NOT NULL,
    phone_number TEXT NOT NULL UNIQUE,
    BID          INTEGER,
    FOREIGN KEY (BID) REFERENCES branch(BID)
);

-- =========================
-- CLIENT
-- =========================
CREATE TABLE client (
    CID          INTEGER PRIMARY KEY,
    CFname       TEXT NOT NULL,
    Cminit       TEXT NOT NULL,
    CLname       TEXT NOT NULL,
    address      TEXT NOT NULL,
    phone_number TEXT NOT NULL UNIQUE,
    gender       INTEGER NOT NULL,
    DOB          TEXT NOT NULL
);

-- =========================
-- ACCOUNT
-- =========================
CREATE TABLE account (
    ACID        INTEGER NOT NULL,
    subaccount  TEXT NOT NULL,
    username    TEXT NOT NULL UNIQUE,
    password    TEXT NOT NULL,
    balance     REAL NOT NULL,
    currency    TEXT NOT NULL,
    type_of     TEXT NOT NULL,
    CID         INTEGER REFERENCES client(CID),
    BID         INTEGER REFERENCES branch(BID),
    Active      INTEGER NOT NULL,
    PRIMARY KEY (ACID, subaccount)
);

-- =========================
-- LOAN OFFER
-- =========================
CREATE TABLE loan_offer (
    LID            INTEGER PRIMARY KEY,
    loan_name      TEXT NOT NULL UNIQUE,
    interest_rate  REAL NOT NULL,
    loan_range_st  TEXT NOT NULL,
    loan_range_end TEXT NOT NULL,
    BID            INTEGER REFERENCES branch(BID)
);

-- =========================
-- APPLICATION
-- =========================
CREATE TABLE application (
    APPID            INTEGER PRIMARY KEY,
    approval         INTEGER NOT NULL,
    status           TEXT NOT NULL,
    application_date TEXT NOT NULL,
    purpose          TEXT NOT NULL,
    CID              INTEGER REFERENCES client(CID),
    ACID             INTEGER,
    subaccount       TEXT,
    FOREIGN KEY (ACID, subaccount)
        REFERENCES account(ACID, subaccount)
        ON DELETE SET NULL
);

-- =========================
-- LOAN
-- =========================
CREATE TABLE loan (
    INFOID              INTEGER PRIMARY KEY,
    loan_due            TEXT NOT NULL,
    loan_release_date   TEXT NOT NULL,
    approved_loan_amount INTEGER NOT NULL,
    CID                 INTEGER REFERENCES client(CID),
    APPID               INTEGER,
    FOREIGN KEY (APPID) REFERENCES application(APPID) ON DELETE SET NULL
);

-- =========================
-- PAYMENT INFO
-- =========================
CREATE TABLE payment_info (
    PID        INTEGER NOT NULL,
    INFOID     INTEGER NOT NULL,
    pay_date   TEXT NOT NULL,
    pay_amount REAL NOT NULL,
    pay_method TEXT NOT NULL,
    ACID       INTEGER,
    subaccount TEXT,
    FOREIGN KEY (ACID, subaccount)
        REFERENCES account(ACID, subaccount)
        ON DELETE SET NULL,
    FOREIGN KEY (INFOID) REFERENCES loan(INFOID),
    PRIMARY KEY (PID, INFOID)
);

-- =========================
-- REPORT
-- =========================
CREATE TABLE report (
    RID          INTEGER PRIMARY KEY,
    date_of      TEXT NOT NULL,
    observation  TEXT,
    EID          INTEGER REFERENCES employee(EID),
    CID          INTEGER REFERENCES client(CID),
    PID          INTEGER,
    INFOID       INTEGER,
    LID          INTEGER,
    FOREIGN KEY (PID, INFOID) REFERENCES payment_info(PID, INFOID),
    FOREIGN KEY (LID) REFERENCES loan_offer(LID) ON DELETE SET NULL
);

-- =========================
-- COLLATERAL
-- =========================
CREATE TABLE collateral (
    APPID                  INTEGER NOT NULL,
    collateral_description TEXT,
    PRIMARY KEY (APPID, collateral_description),
    FOREIGN KEY (APPID) REFERENCES application(APPID) ON DELETE SET NULL
);
