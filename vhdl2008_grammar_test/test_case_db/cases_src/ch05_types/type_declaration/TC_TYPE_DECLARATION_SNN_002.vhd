-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Negative
-- Test Focus: SNN: range_constraint of type_declaration missing bound expressions - in 'type t_bad is range;' there is no bound expression after "range", verifying range_constraint requires complete bounds on both sides
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity td49_ent is end entity;
architecture rtl of td49_ent is
  type t_bad is range;
begin
end architecture;
