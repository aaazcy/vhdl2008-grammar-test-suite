-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Positive
-- Test Focus: attribute_designator with function signature — exercises the signature-based attribute_designator form (attribute_designator of function[type return type] : function is expression) to disambiguate overloaded functions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity as_sig_ent is
  port(a,b : in integer; y : out integer);
end entity;

architecture bh of as_sig_ent is
  attribute impl_style : string;
  function f_add(x,y : integer) return integer is
  begin return x+y; end function;
  function f_add(x,y : bit_vector(3 downto 0)) return integer is
  begin return 0; end function;
  attribute impl_style of f_add[integer, integer return integer] : function is "ripple_carry";
  signal s_a, s_b : integer := 0;
begin
  s_a <= a; s_b <= b;
  y <= f_add(s_a, s_b);
end architecture bh;
