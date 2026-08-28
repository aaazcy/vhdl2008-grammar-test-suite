-- =============================================================
-- Case ID: TC_CONDITION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: condition in a conditional signal assignment: y <= a when sel='1' else b, verifying that the condition after when is a relational expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_cond_when is
  port (
    sel  : in  bit;
    a, b : in  integer;
    y    : out integer
  );
end entity ent_cond_when;

architecture when_cond of ent_cond_when is
begin
  y <= a when sel = '1' else b;
end architecture when_cond;
