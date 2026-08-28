-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: Two when branches: y <= a when c1 else b when c2 else c, verifying the chained structure of two conditional branches
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_ce_two is
  port (
    a, b, c : in  integer;
    hi, lo  : in  integer;
    y       : out integer
  );
end entity ent_ce_two;

architecture two_when of ent_ce_two is
begin
  y <= a when a > hi else
       b when b < lo else
       c;
end architecture two_when;
