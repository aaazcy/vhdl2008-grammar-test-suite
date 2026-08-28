-- =============================================================
-- Case ID: TC_LITERAL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Negative
-- Test Focus: SNN: malformed based literal - missing # delimiters
-- Expected Result: Triggers syntax error: malformed based literal
-- Dependencies: None
-- =============================================================
entity literal_snn1_ent is port(y:out integer); end entity;
architecture bh of literal_snn1_ent is
  signal s:integer:=2FF;
begin y<=s; end architecture bh;
