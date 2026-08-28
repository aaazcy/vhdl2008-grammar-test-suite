-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: relational expression as the condition: y <= a when val > threshold else b, the result of the comparison as the condition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_ce_rel is
  port (
    val      : in  integer;
    thresh   : in  integer;
    above    : in  integer;
    below    : in  integer;
    y        : out integer
  );
end entity ent_ce_rel;

architecture rel_cond of ent_ce_rel is
begin
  y <= above when val > thresh else below;
end architecture rel_cond;
