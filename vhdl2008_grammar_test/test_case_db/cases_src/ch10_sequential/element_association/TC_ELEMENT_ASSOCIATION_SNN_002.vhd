-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Negative
-- Test Focus: SNN: missing expression after arrow - choices => nothing
-- Expected Result: Triggers syntax error: missing expression
-- Dependencies: None
-- =============================================================
entity elem_assoc_snn2_ent is end entity;
architecture bh of elem_assoc_snn2_ent is
  type t_arr is array(0 to 1) of integer;
  signal s:t_arr:=(0=>);
begin end architecture bh;
