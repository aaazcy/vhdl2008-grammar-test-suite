-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: element_association: range choice with OTHERS in array aggregate used as LUT
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity elem_assoc_syn4_ent is port(sel:in integer range 0 to 7; y:out integer); end entity;
architecture bh of elem_assoc_syn4_ent is
  type t_lut is array(0 to 7) of integer;
  constant C_LUT:t_lut:=(0|2|4|6=>100, 1|3|5|7=>200);
begin
  y<=C_LUT(sel);
end architecture bh;
