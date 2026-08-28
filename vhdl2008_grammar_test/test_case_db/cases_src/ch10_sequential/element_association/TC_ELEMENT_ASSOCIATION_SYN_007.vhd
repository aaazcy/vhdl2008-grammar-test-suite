-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: element_association: named association with discrete_range choice covering multiple array indices
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity elem_assoc_syn7_ent is port(y:out integer); end entity;
architecture bh of elem_assoc_syn7_ent is
  type t_buf is array(0 to 7) of integer;
  signal s_buf:t_buf:=(0 to 3=>10, 4 to 7=>20);
  signal s_sum:integer:=0;
begin
  s_sum<=s_buf(0)+s_buf(4)+s_buf(7);
  y<=s_sum;
end architecture bh;
