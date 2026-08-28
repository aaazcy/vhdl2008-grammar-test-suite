-- =============================================================
-- Case ID: TC_TERM_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Positive
-- Test Focus: parenthesized grouping: parentheses change the default left-to-right association, (a * b) + (c / d) avoids ambiguity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity term_paren_ent is
  port(a, b, c, d : in integer; y : out integer);
end entity;
architecture rtl of term_paren_ent is
begin
  y <= (a * b) + (c / d);
end architecture rtl;
