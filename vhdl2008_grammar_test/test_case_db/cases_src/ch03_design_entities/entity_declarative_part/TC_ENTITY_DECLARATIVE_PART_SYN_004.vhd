-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_part ::= { entity_declarative_item }
-- Case Type: Positive
-- Test Focus: Two entity_declarative_items (type+constant) — the entity declarative part contains type t_width range 1 to 64 and constant C_MAX:t_width:=64, verifying two declaration items of different types are legal in sequence in the entity declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edp_two_ent is
  port(raw:in integer; scaled:out integer);
  type t_width is range 1 to 64;
  constant C_MAX:t_width:=64;
end entity edp_two_ent;
architecture bh of edp_two_ent is
begin
  scaled<=raw*integer(C_MAX);
end architecture bh;
