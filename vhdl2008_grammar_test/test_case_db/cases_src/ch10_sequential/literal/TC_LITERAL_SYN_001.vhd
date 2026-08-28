-- =============================================================
-- Case ID: TC_LITERAL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: literal: numeric_literal (integer and real) in signal assignments
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity literal_syn1_ent is port(y_int:out integer; y_real:out real); end entity;
architecture bh of literal_syn1_ent is
begin
  y_int<=42;
  y_real<=3.14159;
end architecture bh;
