-- =============================================================
-- Case ID: TC_LITERAL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_LITERAL_RANGE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Rule Description: Numeric literal value must be within the range of its target type
-- Case Type: Negative
-- Error Category: range_error
-- Test Focus: SEM: integer literal out of range for constrained subtype (1000 > 255)
-- Expected Result: Triggers semantic error: value out of range
-- Dependencies: None
-- =============================================================
entity literal_sem1_ent is port(y:out integer range 0 to 100); end entity;
architecture bh of literal_sem1_ent is
  signal s:integer range 0 to 255:=1000;
begin y<=s; end architecture bh;
