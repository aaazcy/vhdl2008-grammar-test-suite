-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SMN_S01
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Negative
-- Test Focus: Assignment of an enumeration literal from one enum type to a signal declared with a different enum type -- each enumeration_type_definition creates a distinct type; literals declared in one type's parenthesized list belong exclusively to that type, and cross-type assignment without explicit conversion violates VHDL strict type-checking semantics
-- Expected Result: Triggers semantic error: type mismatch
-- Dependencies: None
-- =============================================================
entity enum_crosstype_ent is
  port(r : out integer);
end entity;

architecture bh of enum_crosstype_ent is
  type t_color is (RED, GREEN, BLUE);
  type t_state is (IDLE, ACTIVE, DONE);
  signal sc : t_color := RED;
  signal ss : t_state := IDLE;
begin
  ss <= GREEN;  -- ERROR: GREEN belongs to t_color, not t_state
  r  <= 1;
end architecture bh;
