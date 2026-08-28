-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: element_association: mixed named and positional in signal assignment aggregate target (a,b,c) <= expr
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity elem_assoc_syn6_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of elem_assoc_syn6_ent is
  type t_tri is record x:integer; y:integer; z:integer; end record;
  signal s_x, s_y, s_z:integer:=0;
begin
  process(a,b) is
  begin
    (s_x, s_y, s_z) <= t_tri'(a, b, z=>a+b);
  end process;
  y<=s_x+s_y+s_z;
end architecture bh;
