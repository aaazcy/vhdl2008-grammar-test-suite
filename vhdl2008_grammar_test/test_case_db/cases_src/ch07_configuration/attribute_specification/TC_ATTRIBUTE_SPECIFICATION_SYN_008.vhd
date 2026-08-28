-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Positive
-- Test Focus: attribute_specification with boolean expression and group entity_class — exercises boolean-type attributes and the 'group' entity_class to validate all expression types and the lesser-tested entity_class values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity as_bool_ent is
  port(en : in bit; d : in integer; q : out integer);
end entity;

architecture bh of as_bool_ent is
  signal s_d : integer := 0;
  attribute synthesis_keep : boolean;
  attribute is_pipelined : boolean;
  attribute synthesis_keep of u_pipe : label is true;
  attribute is_pipelined of s_d : signal is en='1' and d>0;
  function f_pipe(x : integer; e : bit) return integer is
  begin if e='1' then return x; else return 0; end if; end function;
begin
  s_d <= d;
  u_pipe: block is
  begin
    q <= s_d when en='1' else 0;
  end block;
end architecture bh;
