-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: Empty statement part - zero concurrent_statements: the architecture declarative part contains types and signals but no concurrent statement after begin, verifying an architecture can be a pure declaration container (such as a package body substitute pattern)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity asp_empty_ent is port(y:out integer); end entity;
architecture bh of asp_empty_ent is
  constant C_VER:integer:=1;
  signal s_ver:integer:=C_VER;
begin
end architecture bh;
