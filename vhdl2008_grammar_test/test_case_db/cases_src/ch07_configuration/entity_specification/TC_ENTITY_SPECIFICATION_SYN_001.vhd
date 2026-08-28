-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Positive
-- Test Focus: entity specification with multiple entity_class values: all:signal + bh:label + ent:entity + f_dbl:function, verifies the entity_name_list reference and entity_class keyword of entity_specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity es_ent is port(a:in bit; y:out bit); end entity;
architecture bh of es_ent is
  attribute note:string;
  signal s:bit;
  attribute note of all:signal is "all_signals";
  attribute note of l_body:label is "arch_label";
  function f_dbl(x:integer) return integer is begin return x*2; end function;
  attribute note of f_dbl[integer return integer]:function is "doubler";
begin
  l_body: block begin
    s<=a; y<=s;
  end block;
end architecture bh;
