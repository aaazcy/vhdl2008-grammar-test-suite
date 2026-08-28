-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Negative
-- Test Focus: SNN: missing arrow in named association - choices without =>
-- Expected Result: Triggers syntax error: missing =>
-- Dependencies: None
-- =============================================================
entity elem_assoc_snn1_ent is end entity;
architecture bh of elem_assoc_snn1_ent is
  type t_arr is array(0 to 1) of integer;
  signal s:t_arr:=(0 10, 1 20);
begin end architecture bh;
