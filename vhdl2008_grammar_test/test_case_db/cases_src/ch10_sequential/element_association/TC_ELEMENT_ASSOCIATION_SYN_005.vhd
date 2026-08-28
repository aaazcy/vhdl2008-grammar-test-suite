-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: element_association: named association using OTHERS keyword for all remaining elements in array aggregate initializer
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity elem_assoc_syn5_ent is port(y:out integer); end entity;
architecture bh of elem_assoc_syn5_ent is
  type t_mem is array(0 to 15) of integer;
  signal s_mem:t_mem:=(0=>1, 1=>2, others=>0);
begin
  y<=s_mem(0)+s_mem(1)+s_mem(15);
end architecture bh;
