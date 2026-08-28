-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SNN_005
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Negative
-- Test Focus: Signature uses fat arrow "=>" instead of reserved word "return" -- the BNF requires "return" as the separator between parameter type_marks and the return type_mark in a function signature; using "=>" is invalid syntax in this context
-- Expected Result: Triggers syntax error (illegal token in signature)
-- Dependencies: None
-- =============================================================
entity ed_snn5_fat_arrow is
  port(
    op_a  : in  integer;
    op_b  : in  integer;
    sum   : out integer
  );
end entity;

architecture bh of ed_snn5_fat_arrow is
  attribute impl : string;
  function f_add(a, b : integer) return integer is
  begin return a + b; end function;
  function f_add(a, b : bit) return integer is
  begin return 0; end function;
  -- ERROR: "=>" is not valid in a signature; use "return" keyword
  attribute impl of f_add [integer, integer => integer] : function is "adder";
  signal ra, rb : integer := 0;
begin
  ra <= op_a; rb <= op_b;
  sum <= f_add(ra, rb);
end architecture bh;
