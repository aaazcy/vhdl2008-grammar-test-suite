-- =============================================================
-- Case ID: TC_TERM_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Positive
-- Test Focus: chain of all four operators: * / mod rem combine in one expression according to the precedence chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity term_all_ops_ent is
  port(a, b, c, d, e : in integer; y : out integer);
end entity;
architecture rtl of term_all_ops_ent is
begin
  y <= a * b / c mod d rem e;
end architecture rtl;
