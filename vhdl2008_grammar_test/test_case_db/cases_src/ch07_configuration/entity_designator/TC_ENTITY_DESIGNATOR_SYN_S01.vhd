-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Test Focus: Entity designator production-specific: uses entity_tag with function signature [integer,integer return integer] to identify a specific overloaded function, plus plain signal names as simple entity_tags
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_prod_specific is
  port(a,b : in integer; y : out integer);
  attribute opt : string;
  attribute opt of a, b, y : signal is "io_pins";
end entity;

architecture bh of ed_prod_specific is
  function f_add(x,y:integer) return integer is begin return x+y; end function;
  function f_mul(x,y:integer) return integer is begin return x*y; end function;
  attribute opt of f_add[integer,integer return integer] : function is "keep";
  signal s_a, s_b : integer := 0;
begin
  s_a <= a; s_b <= b;
  y <= f_add(f_mul(s_a, 2), s_b);
end architecture bh;
