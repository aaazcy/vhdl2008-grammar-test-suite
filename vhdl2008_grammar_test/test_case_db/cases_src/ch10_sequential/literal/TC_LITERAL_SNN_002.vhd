-- =============================================================
-- Case ID: TC_LITERAL_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Negative
-- Test Focus: SNN: malformed string literal - unclosed quotes
-- Expected Result: Triggers syntax error: unclosed string
-- Dependencies: None
-- =============================================================
entity literal_snn2_ent is port(y:out string(1 to 4)); end entity;
architecture bh of literal_snn2_ent is
  signal s:string(1 to 4):="OPEN;
begin y<=s; end architecture bh;
