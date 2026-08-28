-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Positive
-- Test Focus: expression as arithmetic expression — 'is expression' uses a computed integer expression (constant*2) rather than a simple literal, verifying that the expression can be any valid VHDL expression tree
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity as_expr_ent is
  port(a : in integer; y : out integer);
end entity;

architecture bh of as_expr_ent is
  constant BASE : integer := 16;
  signal s_val : integer := 0;
  attribute bus_width : integer;
  attribute bus_width of s_val : signal is BASE * 2;
  function f_scale(x : integer) return integer is
  begin return x * 4; end function;
begin
  s_val <= a;
  y <= f_scale(s_val);
end architecture bh;
