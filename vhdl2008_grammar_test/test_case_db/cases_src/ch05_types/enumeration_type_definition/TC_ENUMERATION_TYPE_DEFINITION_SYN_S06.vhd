-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SYN_S06
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Positive
-- Test Focus: Large enumeration type with 9 pure-identifier literals used with a selected signal assignment -- validates the repeated comma-separated enumeration_literal pattern across a non-trivial list length, exercising the grammar's recursive { , enumeration_literal } expansion
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_large_ent is
  port(
    opcode : in  integer range 0 to 8;
    result : out bit
  );
end entity;

architecture rtl of enum_large_ent is
  type t_instr is (NOP, LOAD, STORE, ADD, SUB, AND_OP, OR_OP, XOR_OP, SHIFT);
  signal instr : t_instr;
begin
  with opcode select
    instr <=
      NOP    when 0,
      LOAD   when 1,
      STORE  when 2,
      ADD    when 3,
      SUB    when 4,
      AND_OP when 5,
      OR_OP  when 6,
      XOR_OP when 7,
      SHIFT  when 8;

  with instr select
    result <=
      '1' when ADD | SUB | AND_OP | OR_OP,
      '0' when others;
end architecture rtl;
