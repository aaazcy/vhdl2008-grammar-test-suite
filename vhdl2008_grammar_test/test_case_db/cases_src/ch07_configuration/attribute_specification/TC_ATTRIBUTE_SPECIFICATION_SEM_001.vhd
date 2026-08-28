-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SEM_001
-- Related Rule ID: SEM_ATTRIBUT_001
-- Rule Type: Semantic
-- BNF Production: ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic attribute specification on multiple entity classes — verifies that attribute values are correctly attached to entity, architecture, signal, and function entity classes, with a meaningful expression (aggregate) as the attribute value
-- Expected Result: Compiles successfully; attribute semantics verified
-- Dependencies: None
-- =============================================================
entity as_sem_multi is
  port(a,b : in bit; y : out bit);
  attribute pin_info : bit_vector;
  attribute pin_info of a : signal is "0001";
  attribute pin_info of b : signal is "0010";
  attribute pin_info of y : signal is "0100";
  attribute chip_type : string;
  attribute chip_type of as_sem_multi : entity is "logic_gate";
end entity;

architecture bh of as_sem_multi is
  signal s_and : bit := '0';
  function f_nand(x,y:bit) return bit is begin return not(x and y); end function;
  attribute builtin : boolean;
  attribute builtin of f_nand[bit,bit return bit] : function is true;
begin
  s_and <= a and b;
  y <= f_nand(s_and, b);
end architecture bh;
