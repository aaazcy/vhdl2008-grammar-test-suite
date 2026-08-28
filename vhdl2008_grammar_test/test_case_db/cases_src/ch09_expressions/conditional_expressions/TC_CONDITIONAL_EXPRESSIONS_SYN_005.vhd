-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: boolean expression as the condition: y <= a when (x and y) else b, a logical combination as the condition after when
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_ce_bool is
  port (
    x, y : in  boolean;
    a, b : in  integer;
    z    : out integer
  );
end entity ent_ce_bool;

architecture bool_cond of ent_ce_bool is
begin
  z <= a when (x and y) else b;
end architecture bool_cond;
