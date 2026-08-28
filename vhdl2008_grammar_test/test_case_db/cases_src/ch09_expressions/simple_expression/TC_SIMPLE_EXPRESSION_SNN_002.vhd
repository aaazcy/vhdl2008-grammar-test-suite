-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Negative
-- Test Focus: SNN — double sign: consecutive +- prefixes appear, the BNF allows only one optional [ sign ], double prefixes are not supported
-- Expected Result: Triggers syntax error: consecutive signs not allowed
-- Dependencies: None
-- =============================================================
entity sexpr_snn2_ent is
  port(a : in integer; y : out integer);
end entity;
architecture err of sexpr_snn2_ent is
begin
  y <= +-a;
end architecture err;
