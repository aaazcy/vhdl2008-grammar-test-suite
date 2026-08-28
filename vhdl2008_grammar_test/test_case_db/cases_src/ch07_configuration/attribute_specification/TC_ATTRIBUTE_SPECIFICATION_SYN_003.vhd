-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Positive
-- Test Focus: attribute_specification with 'others' and 'all' in entity_name_list — exercises entity_name_list alternatives: others ｜ all with various entity_class values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attr_spec_others_all_ent is
  port(a : in integer; b : in integer; sum : out integer; diff : out integer);
end entity;

architecture bh of attr_spec_others_all_ent is
  attribute pin_count : integer;
  attribute chip_name : string;
  signal s_a, s_b, s_sum, s_diff : integer := 0;
  attribute pin_count of others : signal is 4;
  attribute chip_name of all : signal is "alu_slice";
  function f_add(x,y:integer) return integer is
  begin return x+y; end function;
  function f_sub(x,y:integer) return integer is
  begin return x-y; end function;
begin
  s_a <= a; s_b <= b;
  s_sum <= f_add(s_a, s_b);
  s_diff <= f_sub(s_a, s_b);
  sum <= s_sum; diff <= s_diff;
end architecture bh;
