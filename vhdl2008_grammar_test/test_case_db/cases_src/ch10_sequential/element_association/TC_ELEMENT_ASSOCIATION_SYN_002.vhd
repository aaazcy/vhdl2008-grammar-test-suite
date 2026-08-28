-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: element_association: positional association (no choices) in aggregate
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity elem_assoc_syn2_ent is port(y:out integer); end entity;
architecture bh of elem_assoc_syn2_ent is
  type t_vec is array(0 to 2) of integer;
  signal s_vec:t_vec:=(0, 1, 2);
begin
  y<=s_vec(0)+s_vec(1)+s_vec(2);
end architecture bh;
