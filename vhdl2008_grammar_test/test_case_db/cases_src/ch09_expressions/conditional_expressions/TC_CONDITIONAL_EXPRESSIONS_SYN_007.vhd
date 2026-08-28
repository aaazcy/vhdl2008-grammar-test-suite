-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: complete when-else chain in a concurrent signal assignment: conditional expressions used for signal assignment in concurrent statements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_ce_concur is
  port (
    temp : in  integer;
    hot  : out bit;
    cold : out bit
  );
end entity ent_ce_concur;

architecture concurrent_ce of ent_ce_concur is
begin
  hot  <= '1' when temp > 100 else '0';
  cold <= '1' when temp < 0   else '0';
end architecture concurrent_ce;
