-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Negative
-- Test Focus: SNN: malformed named association — missing expression while having choices present before arrow
-- Expected Result: Triggers syntax error: missing expression after =>
-- Dependencies: None
-- =============================================================
entity elem_assoc_snn3_ent is end entity;
architecture bh of elem_assoc_snn3_ent is
  type t_arr is array(0 to 1) of integer;
  signal s:t_arr:=(0=>, 1=>20);
begin end architecture bh;
