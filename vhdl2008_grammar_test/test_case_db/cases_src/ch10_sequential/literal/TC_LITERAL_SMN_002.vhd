-- =============================================================
-- Case ID: TC_LITERAL_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_LITERAL_OVERFLOW
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Negative
-- Test Focus: SEM: real literal assigned to integer signal without conversion — type mismatch between real literal and integer target
-- Expected Result: Triggers semantic error: type mismatch, real literal to integer
-- Dependencies: None
-- =============================================================
entity literal_sem2_ent is port(y:out integer); end entity;
architecture bh of literal_sem2_ent is
  signal s:integer:=3.14;
begin y<=s; end architecture bh;
