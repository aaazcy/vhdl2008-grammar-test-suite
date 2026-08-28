-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SYN_S04
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Positive
-- Test Focus: enum used as array index type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_spc4_ent is port(r:out integer); end entity;
architecture bh of enum_spc4_ent is
  type t_op is (ADD, SUB, MUL, DIV);
  type t_op_table is array(t_op) of integer;
  constant C_TABLE : t_op_table := (ADD=>1, SUB=>2, MUL=>3, DIV=>4);
  signal s_op : t_op := ADD;
begin
  r <= C_TABLE(s_op);
end architecture bh;
