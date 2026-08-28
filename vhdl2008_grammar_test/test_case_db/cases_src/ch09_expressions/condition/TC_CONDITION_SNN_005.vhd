-- =============================================================
-- Case ID: TC_CONDITION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Negative
-- Test Focus: SNN: missing condition after when — y <= a when else b; in a conditional signal assignment the condition expression is missing after when
-- Expected Result: Triggers syntax error: missing condition after 'when'
-- Dependencies: None
-- =============================================================

entity ent_cond_snn_005 is
  port (
    sel : in  bit;
    a   : in  integer;
    b   : in  integer;
    y   : out integer
  );
end entity ent_cond_snn_005;

architecture miss_cond of ent_cond_snn_005 is
begin
  -- ERROR: Missing condition after 'when' keyword
  y <= a when else b;
end architecture miss_cond;
