-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: Minimal form: single when + else — y <= a when sel='1' else b; the minimal conditional expression with one conditional branch plus a final else
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_ce_simple is
  port (
    sel : in  bit;
    a   : in  integer;
    b   : in  integer;
    y   : out integer
  );
end entity ent_ce_simple;

architecture one_when of ent_ce_simple is
begin
  y <= a when sel = '1' else b;
end architecture one_when;
