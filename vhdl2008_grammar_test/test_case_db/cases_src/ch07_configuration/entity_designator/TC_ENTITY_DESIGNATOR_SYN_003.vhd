-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Positive
-- Test Focus: entity_designator with signature — entity_tag followed by [signature] to disambiguate overloaded subprograms; tests the optional signature in entity_designator used in attribute specification on overloaded functions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_sig_ent is
  port(a : in integer; b : in integer; result : out integer);
end entity;

architecture bh of ed_sig_ent is
  attribute impl_note : string;
  function f_op(x, y : integer) return integer is
  begin return x + y; end function;
  function f_op(x, y : bit_vector(3 downto 0)) return bit_vector is
  begin return x; end function;
  attribute impl_note of f_op [integer, integer return integer] : function is "integer_adder";
  signal a_reg, b_reg, r_reg : integer := 0;
begin
  a_reg <= a; b_reg <= b;
  r_reg <= f_op(a_reg, b_reg);
  result <= r_reg;
end architecture bh;
